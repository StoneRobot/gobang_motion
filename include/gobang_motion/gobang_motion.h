#pragma once

#include <ros/ros.h>

#include "CommApi.h"
#include "Hsc3Def.h"
#include "proxy/ProxyMotion.h"
#include "proxy/ProxyIO.h"
#include "proxy/ProxySys.h"
#include "proxy/ProxyVm.h"
#include "proxy/ProxyVar.h"

#include "gomoku_vision/GetPickPoint.h"
#include "gobang_motion/RobotMove.h"

using namespace std;
using namespace Hsc3::Comm;
using namespace Hsc3::Proxy;

class GobangMotion
{
private:
    CommApi *commapi;
    ProxyMotion *proMo;
    ProxyIO *proIO;
    ProxySys *proSys;
    ProxyVm * proVm;
    ProxyVar *proVar;
    ros::NodeHandle* nh;
    string robotIp_;
    int robotPort_;
    int row_;
    int col_;

    const int motionCtrReg = 11;
    const int rowReg = 12;
    const int colReg = 13;

private:
    bool setR(int index, double val);
    int setLR(int8_t gpid, int32_t index, const LocPos& pos);

public:
    GobangMotion(ros::NodeHandle* n, string robotIP, int robotPort);
    ~GobangMotion();
    int connect();
    int startProgram(const std::string& path, const std::string& fileName);
    int unloadProgram(const string& fileName);

    /**
     * @brief 机器人是否在动作
     * @return 0为停止
    */
    int getActionState();

    /**
     * @brief 设置拾取的棋子的位置
     * @param
     * @return 0为拾取成功
    */
    int setPickPoint(double x, double y);

    // /**
    //  * @brief 捡起棋子
    //  * @return 0为成功
    // */
    // int pickChess(bool block=true);

    /**
     * @brief 设置放置棋子的在棋盘上的索引
     * @param row 
     * @return 0为成功
    */
    int setChessboardIndex(int row, int col);

    // /**
    //  * @brief 放下棋子
    //  * @return 0为成功
    // */
    // int placeChess(bool block=true);

    /**
     * @brief 控制机器人做示教器编写的程序
     * @param type 1 放棋子, 2 抓棋子, 3 去检测点
     * @param block 是否阻塞
     * @return 成功返回0
    */
    int motion(int type, bool block=true);

};
