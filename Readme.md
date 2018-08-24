# Evaluating Redgate Data Gen

## What's included

+ A Visual Studio Data Project
+ Redgate Generator file
+ Instruction to build this in docker

## Problem

The `[CustomerEvent]` Table needs to have Events with `[EventTimeStamp]` between `[Customer].[CustomerEnteredDateTime]` and `[Customer].[CustomerExitedDateTime]`

## Getting Setup

### Docker Steps

_Use docker its amazing!_

1. Install Docker Community edition

2. Execute `docker pull microsoft/mssql-server-windows-developer` [see here](https://hub.docker.com/r/microsoft/mssql-server-windows-developer/)

3. Create a folder `C:\DockerPersistedStorage\sqlDock` so that you can save stuff from the docker container.

4. Run the Docker Image `docker run -d -p 1433:1433 --name sqlDock --hostname sqlDock -e sa_password=ThisIsTheBestPassword --volume 'C:\DockerPersistedStorage\sqlDock:C:\DockerPersistedStorage\sqlDock'  -e ACCEPT_EULA=Y microsoft/mssql-server-windows-developer`

5. Wait 60 Seconds....

6. Remember when done to stop docker by `docker rm sqldock --force`

This will or should have setup a Sql Instance named `sqldock`

### Create the Database

1. Open SSMS connect using `sqldock`,`sa`,`ThisIsTheBestPassword`

2. Create Database with FileGroups in in `C:\dockerpersistedstorage\sqldock\`. This persists your database, so when you shutdown docker you still have the db. You can skip persisted storage if you don't care about this. 

```sql
   CREATE DATABASE [RGDataGenerator]   ON  PRIMARY    ( NAME = N'RGDataGenerator', FILENAME = N'C:\dockerpersistedstorage\sqldock\RGDataGenerator.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )   LOG ON    ( NAME = N'Oneview_log', FILENAME = N'C:\dockerpersistedstorage\sqldock\RGDataGenerator.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )  
```

### Deploy the Visual Studio Data Project

1. Open the SLN in SqlDataGenerator

2. Publish the Project (pretty straight forward)

![](https://raw.githubusercontent.com/kgeorge314/RedGateDataGenPoc/master/assets/00_publish.png)

3. Hopefully everything goes well you are now setup.
