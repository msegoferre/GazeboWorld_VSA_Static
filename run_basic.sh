#!/bin/bash

sleep 1

#--------------------- Adding local model directory to the main .sdf



#---------------------EDGE

TERMINAL_ID_0=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 0)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 0 "Simulator"

SESSION_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 1)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 1 "Gazebo2Robocomp"


SESSION_ID_2=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID_2=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 2)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 2 "Other"


#---------------------GAZEBO SIMULATOR------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "export GZ_SIM_RESOURCE_PATH=./local_models/" #- Adding local model directory to the main .sdf
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "rcnode&"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "cd ~/static_world"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "gz sim static_world.sdf"

sleep 4

#---------------------Gazebo2Robocomp------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "cd ~/Repositories/gazebo-bridge/"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "bin/Gazebo2Robocomp etc/config_invertedpendulum"

sleep 1
