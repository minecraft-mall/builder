#
# Cookbook Name:: mc_server
# Attribute:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



default['mc_server']['root']['dir'] = 'C:\minecraft'
default['mc_server']['root']['wk_dir'] = "#{Chef::Config[:file_cache_path].gsub(/\//, '\\')}\\mc_server"

default['mc_server']['jre']['file'] = 'jre-8u73-windows-x64.exe'
default['mc_server']['jre']['dir'] = node['mc_server']['root']['wk_dir']
default['mc_server']['jre']['INSTALLDIR'] = 'C:\Java'

default['mc_server']['firewall']['name'] = 'minecraft_server'
default['mc_server']['firewall']['port'] =  25565

default['mc_server']['download']['files']['installer.jar'] = 'http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.1763/forge-1.8.9-11.15.1.1763-installer.jar'
default['mc_server']['download']['files']['universal.jar'] = 'http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.1763/forge-1.8.9-11.15.1.1763-universal.jar'
default['mc_server']['download']['dir'] = node['mc_server']['root']['dir']

default['mc_server']['install']['dir'] = node['mc_server']['root']['dir']
default['mc_server']['install']['jar'] = 'installer.jar'
default['mc_server']['install']['java'] = "#{node['mc_server']['jre']['INSTALLDIR']}\\bin\\java.exe"

default['mc_server']['settings']['dir'] = node['mc_server']['root']['dir']
default['mc_server']['settings']['eula'] = 'eula.txt'
default['mc_server']['settings']['properties'] = 'server.properties'
default['mc_server']['settings']['tem_properties'] = 'server.properties'
default['mc_server']['settings']['par_properties']['rcon.password'] = 'ILoveDevOps'

default['mc_server']['makeTask']['name'] = 'StartMinecraftServer'
default['mc_server']['makeTask']['output'] = 'SMS.xml'
default['mc_server']['makeTask']['template'] = node['mc_server']['makeTask']['output']
default['mc_server']['makeTask']['dir'] = node['mc_server']['root']['wk_dir']
default['mc_server']['makeTask']['param']['java'] = "#{node['mc_server']['jre']['INSTALLDIR']}\\bin\\java.exe"
default['mc_server']['makeTask']['param']['Xmx'] = 4096
default['mc_server']['makeTask']['param']['Xms'] = 2048
default['mc_server']['makeTask']['param']['jar'] = "universal.jar"
default['mc_server']['makeTask']['param']['dir'] = node['mc_server']['root']['dir']

default['mc_server']['mcrcon']['wk_dir'] = node['mc_server']['root']['wk_dir']
default['mc_server']['mcrcon']['file'] = 'mcrcon.exe'
default['mc_server']['mcrcon']['paths']['x86'] = 'C:\Windows\SysWOW64'
default['mc_server']['mcrcon']['paths']['x64'] = 'C:\Windows\System32'  

default['mc_server']['start']['name'] = node['mc_server']['makeTask']['name']

default['mc_server']['DynamicWebBaseMap']['file'] = 'Dynmap-HEAD-forge-1.8.9.jar'
default['mc_server']['DynamicWebBaseMap']['source'] = 'http://dynmap.us/builds/DynmapForge/Dynmap-HEAD-forge-1.8.9.jar'
default['mc_server']['DynamicWebBaseMap']['dir'] = "#{node['mc_server']['root']['dir']}\\mods"
default['mc_server']['DynamicWebBaseMap']['port'] = 8123
default['mc_server']['DynamicWebBaseMap']['name'] = 'DynamicWebBaseMap'

default['mc_server']['fullrender']['password'] = node['mc_server']['settings']['par_properties']['rcon.password']