---
layout: post
title:  "Configuring an Azure Environment - Health and Security"
date:   2022-11-30 08:35:18 +1000
category: [cloud, azure]
author: mattyboisterous 
---
The following is a checklist of tasks that should be performed when configuring a higher level Azure environment.

## App Service: Turn on Auto Heal

Auto-Heal is highly recommended for production applications that need to ensure high availability and resilience. Although Auto-Heal is not an eventual fix for issues your application may encounter, it allows your application to quickly recover from unexpected issues.

Auto-healing is a mitigation action you can take when your app is having unexpected behaviour.
You can set your own rules based on request count, slow request, memory limit, and HTTP status code to trigger mitigation actions.

https://azure.github.io/AppService/2018/09/10/Announcing-the-New-Auto-Healing-Experience-in-App-Service-Diagnostics.html

## App Service: Configure and enable health check feature

Health check increases your application's availability by removing unhealthy instances from the load balancer. If your instance remains unhealthy, it will be restarted.

Health check increases your application's availability by re-routing requests away from unhealthy instances, and replacing instances if they remain unhealthy. Your App Service plan should be scaled to two or more instances to fully utilize Health check. 

Health check configuration changes restart your app. To minimize impact to production apps, we recommend configuring staging slots and swapping to production.
https://docs.microsoft.com/en-us/azure/app-service/monitor-instances-health-check?tabs=dotnet

## App Service: Enable proactive CPU monitoring

Proactive CPU monitoring provides you an easy, proactive way to take an action when your app or child process for your app is consuming high CPU resources.

### Finding Proactive CPU Monitoring
To access Proactive CPU Monitoring, browse to your App Service web app in Azure portal and click Diagnose and solve problems in the left navigation panel. Then, click on the homepage tile named Diagnostic Tools. Once you are inside Diagnostic Tools, click Proactive CPU Monitoring.

https://azure.github.io/AppService/2019/10/07/Mitigate-your-CPU-problems-before-they-even-happen.html

## App Service: Implement Application Insights into Web App/Web Api

Ensure that the web site has implemented Application Insights. Low level logs can be routed locally to Seq using Serilog and also to Application Insights for all Azure environments.

https://datalust.co/seq
https://blog.johnnyreilly.com/2021/01/30/aspnet-serilog-and-application-insights
https://docs.microsoft.com/en-us/azure/azure-monitor/app/asp-net-core
https://docs.microsoft.com/en-us/azure/azure-monitor/app/asp-net

## App Center: Route App Center analytics to Application Insights

https://dailydotnettips.com/exporting-visual-studio-app-center-data-to-azure-application-insights/

## SQL Azure: Configure backups of SQL Server

By default, SQL Database and SQL Managed Instance store data in geo-redundant storage blobs that are replicated to a paired region. 

If a transaction log is damaged, work that is performed since the most recent valid backup is lost. Therefore we strongly recommend that you put your log files on fault-tolerant storage.

If a database is damaged or you are about to restore the database, we recommend that you create a tail-log backup to enable you to restore the database to the current point in time.

https://docs.microsoft.com/en-us/azure/azure-sql/database/automated-backups-overview?tabs=single-database

## SQL Azure: Enable automatic tuning

Azure SQL Database includes database advisors that provide performance tuning recommendations for single and pooled databases. These recommendations are available in the Azure portal as well as by using PowerShell.

You can also enable automatic tuning so that Azure SQL Database can automatically implement these tuning recommendations.

https://docs.microsoft.com/en-us/azure/azure-sql/database/database-advisor-implement-performance-recommendations#:~:text=Azure%20SQL%20Database%20has%20a,patterns%20that%20help%20improve%20performance.

## Azure Storage: Configure backup of Storage accounts

Storage accounts must be of kind "StorageV2" for this option to be available.

https://docs.microsoft.com/en-us/azure/backup/blob-backup-configure-manage

## Azure: Use Azure Advisor, Azure Defender, Azure Sentinal and review advice

https://techcommunity.microsoft.com/t5/itops-talk-blog/what-s-the-difference-between-azure-security-center-azure/ba-p/2155188















