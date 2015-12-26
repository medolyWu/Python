#!/usr/bin/env python
# coding=utf-8
import os
import sys

class SvnShell(object):
    
    statusPath  = '/tmp/svnstatus'
    projectPath = '.'

    #进入项目目录
    def __init__(self,operation):
        os.chdir(self.projectPath)
        if operation == 'add':
            self.svnAdd()
        elif operation == 'revert':
            self.revertAdd()
        elif operation == 'commit':
            self.commitSvn()
        elif operation == 'st':
            self.createSvnStatusFile()
        elif operation == 'delete':
            self.delete()
        elif operation == 'fc':
            self.fastCommit()
    #生成文件
    def createSvnStatusFile(self,status = 1):
        os.popen('svn st > ' + self.statusPath)
        if status == 1: 
            os.system('vim ' + self.statusPath)
            print ("svn status 文件生成成功.路径为：" + self.statusPath)

    #处理文件
    def __handleFile(self,svnType):
        if os.path.exists(self.statusPath) == False:
            sys.exit('警告!!svnstatus 文件还未建立,请先执行st 命令')
        fileData = open(self.statusPath)
        svnStr = ''
        newStr = ''
        for line in fileData:
            if svnType == 'commit':
                if line[0] == 'M' or line[0] == 'A' or line[0] == 'D':
                    svnStr += " " + line[1:].strip()
            elif line[0] == svnType:
                if svnType == '?':
                    newStr += "A " + line[1:] 
                elif svnType == '!':
                    newStr += "D " + line[1:] 
                elif svnType == 'A':
                    newStr += "? " + line[1:] 
                elif svnType == 'D':
                    newStr += ''
                svnStr += " " + line[1:].strip()
            else:
                newStr += line
        if newStr != '':
            f=file(self.statusPath,"w+")
            f.write(newStr)
        return svnStr 

    #添加新增文件    
    def svnAdd(self):
        addStr = self.__handleFile('?')
        if addStr == '':
            sys.exit('提示：没有可添加的文件!!!!')
        os.system("svn add " + addStr)

    #撤销添加的文件
    def revertAdd(self):
        revertType = len(sys.argv) >= 3 and sys.argv[2] or "all"        
        #self.createSvnStatusFile(0)
        if revertType == 'all':
            revStr = self.__handleFile('A') + self.__handleFile('D')
            if revStr == '':
                sys.exit('提示：没有可恢复的文件!!!!')
        else:
            revStr = self.__handleFile(revertType)
            if revStr == '':
                sys.exit('提示：没有可恢复的文件!!!!')
        os.system("svn revert " + revStr)

    #删除文件
    def delete(self):
        deleteStr = self.__handleFile('!')
        if deleteStr == '':
            sys.exit('提示：没有可删除的文件!!!!')
        os.system("svn delete " + deleteStr)

    #提交文件
    def commitSvn(self):
        if os.path.exists(self.statusPath) == False:
            sys.exit('警告!!svn status 文件还未建立,请先执行st 命令')
        message = len(sys.argv) >= 3 and sys.argv[2] or "''"        
        commitStr = self.__handleFile('commit')
        if commitStr != '':
            os.system("svn commit -m " + message + commitStr)
            os.remove(self.statusPath)
        else:
            print ("提示：没有可提交的文件!!!!")
    #快速提交
    def fastCommit(self):
        addStr = self.__handleFile('?')
        deleteStr = self.__handleFile('!')
        if addStr != '':
            os.system("svn add " + addStr)
        if deleteStr != '':
            os.system("svn delete " + deleteStr)
        self.commitSvn()
if len(sys.argv) < 2:
    sys.exit('警告：请选择命令 st-生成svnstatus文件 add-添加新增文件 delete-添加删除文件 fc-可快速提交文件')
SvnShell(sys.argv[1])

