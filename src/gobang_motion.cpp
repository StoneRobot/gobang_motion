#include "gobang_motion/gobang_motion.h"
#include <ros/ros.h>
#include <gobang_motion/RobotMove.h>

GobangMotion *g;

GobangMotion::GobangMotion(ros::NodeHandle *n, string robotIP, int robotPort)
{
    nh = n;
    commapi = new CommApi();
    proMo = new ProxyMotion(commapi);
    proIO = new ProxyIO(commapi);
    proSys = new ProxySys(commapi);
    proVm = new ProxyVm(commapi);
    proVar = new ProxyVar(commapi);
    commapi->setAutoConn(false); //关闭自动重连功能，否则连接失败
    robotIp_ = robotIP;
    robotPort_ = robotPort;
    connect();
}

GobangMotion::~GobangMotion()
{
    delete commapi;
    delete proMo;
    delete proIO;
    delete proSys;
    proIO = NULL;
    proMo = NULL;
    commapi = NULL;
    proSys = NULL;
}

int GobangMotion::connect()
{
    static int i = 0;
    cout << "IP: " << robotIp_ << endl;
    int ret = commapi->connect(robotIp_, (uint16_t)robotPort_);
    if(commapi->isConnected())
    {
        i = 0;
        return 0;
    }
    if (ret != 0)
    {
        cout << "机器人连接失败, return value: " << ret << endl;
        if(i < 3)
        {
            i++;
            connect();
        }
        i = 0;
        return -1;
    }
    i = 0;
    cout << "机器人连接成功" << endl;
    return 0;
}

int GobangMotion::startProgram(const std::string &path, const std::string &fileName)
{
    connect();
    cout << "load & start Program;" << endl;
    cout << "path: " << path << endl;
    cout << "program: " << fileName << endl;
    if (proVm->load(path, fileName) == 0)
    {
        sleep(2);
        if (proVm->start(fileName) == 0)
        {
            cout << "程序开始成功" << endl;
            return 0;
        }
        cout << "程序启动失败" << endl;
    }
    else
    {
        cout << "加载程序失败" << endl;
    }
    return -1;
}

int GobangMotion::unloadProgram(const string &fileName)
{
    connect();
    if (proVm->stop(fileName) == 0)
    {
        if (proVm->unload(fileName) == 0)
        {
            cout << "程序卸载成功" << endl;
            return 0;
        }
        cout << "程序卸载失败" << endl;
    }
    else
    {
        cout << "程序停止失败" << endl;
    }
    return -1;
}

int GobangMotion::setChessboardIndex(int row, int col)
{
    connect();
    if (setR(rowReg, row) && setR(colReg, col))
    {
        return 0;
    }
    else
    {
        return -1;
    }
}

int GobangMotion::placeChess(bool block)
{
    connect();
    if (setR(motionCtrReg, 1))
    {
        while (getActionState() != 0 && block && ros::ok())
        {
            sleep(1);
        }
        cout << "设置放置棋子成功" << endl;
        return 0;
    }
    else
    {
        cout << "设置放置棋子失败" << endl;
        return -1;
    }
}

bool GobangMotion::setR(int index, double val)
{
    proVar->setR(index, val);
    sleep(2);
    double getVal;
    proVar->getR(index, getVal);
    cout << "R寄存器: " << index << ", value: " << val << endl;
    if ((int)val == (int)getVal)
    {
        cout << "设置成功" << endl;
        return true;
    }
    else
    {

        cout << "设置失败" << endl;
        return false;
    }
}

int GobangMotion::setLR(int8_t gpId, int32_t index, const LocPos &pos)
{
    proVar->setLR(gpId, index, pos);
    LocPos getPose;
    sleep(1);
    proVar->getLR(gpId, index, getPose);
    cout << "L寄存器: " << index << endl;
    for (int i = 0; i < pos.vecPos.size(); i++)
    {
        if (pos.vecPos[i] != getPose.vecPos[i])
        {
            cout << "设置LR寄存器失败" << endl;
            return -1;
        }
    }
    cout << "设置LR寄存器成功" << endl;
    return 0;
}

int GobangMotion::setPickPoint(double x, double y)
{
    connect();
    if (setR(20, x) && setR(21, y))
    {
        return 0;
    }
    else
    {
        return -1;
    }
    return 0;
}

int GobangMotion::pickChess(bool block)
{
    connect();
    if (setR(motionCtrReg, 2))
    {
        while (getActionState() != 0 && block && ros::ok())
        {
            sleep(1);
        }
        cout << "拾取棋子成功" << endl;
        return 0;
    }
    else
    {
        cout << "拾取棋子失败" << endl;
        return -1;
    }
}

int GobangMotion::getActionState()
{
    double val;
    proVar->getR(motionCtrReg, val);
    return (int)val;
}

int GobangMotion::motion(int type, bool block)
{
    connect();
    if (setR(motionCtrReg, type))
    {
        while (getActionState() != 0 && block && ros::ok())
        {
            sleep(1);
        }
        cout << "运动成功" << endl;
        return 0;
    }
    else
    {
        cout << "设置运动失败" << endl;
        return -1;
    }
}

bool callback(gobang_motion::RobotMove::Request &req, gobang_motion::RobotMove::Response &rep)
{
    if (g->pickChess(true) == 0)
    {
        if (g->setChessboardIndex(req.row, req.col) == 0)
            ;
        g->placeChess();
    }
    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "gobang_motion_node_test");
    ros::NodeHandle nh;
    ros::AsyncSpinner spin(2);
    spin.start();
    ros::ServiceServer ser = nh.advertiseService("/robot_move_point", callback);
    ros::ServiceClient pick_point_client = nh.serviceClient<gomoku_vision::GetPickPoint>("/get_pick_point");
    g = new GobangMotion(&nh, "10.10.56.214", 23234);
    // g.setChessboardIndex(1, 2);
    if (g->startProgram("./script", "GOBANG.PRG") != 0)
    {
        cout << "加载程序失败" << endl;
        return -1;
    }
    cout << "按下\'enter\'继续" << endl;
    // cin.ignore();
    cin.ignore();
    g->motion(3);
    sleep(2);
    gomoku_vision::GetPickPoint srv;
    if (pick_point_client.call(srv))
    {
        double x, y;
        x = srv.response.pick_x;
        y = srv.response.pick_y;
        cout << "x: " << x << "y: " << y << endl;
        if (g->setPickPoint(x, y) == 0)
        {
            sleep(1);
            g->motion(2);
        }
    }
    g->unloadProgram("GOBANG.PRG");
    return 0;
}
