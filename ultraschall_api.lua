--[[
################################################################################
# 
# Copyright (c) 2014-2017 Ultraschall (http://ultraschall.fm)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# 
################################################################################
]] 

-- 1. put the ultraschall_api-folder into your ressources-folder. The whole folder, not just the contents!
-- 2. open a new Lua-script in Reaper
-- 3. type in 
--          dofile(reaper.GetResourcePath().."/UserPlugins/ultraschall_api.lua")
-- 4. have fun using the API. Test it with ultraschall.ApiTest()


if type(ultraschall)~="table" then ultraschall={} end

if reaper.GetOS() == "Win32" or reaper.GetOS() == "Win64" then
    ultraschall.Separator = "\\"
  else
    ultraschall.Separator = "/"
  end

local info = debug.getinfo(1,'S');
ultraschall.Script_Path = info.source:match[[^@?(.*[\/])[^\/]-$]]
local script_path = reaper.GetResourcePath().."/UserPlugins/ultraschall_api"..ultraschall.Separator
ultraschall.Api_Path=script_path
ultraschall.Api_Path=string.gsub(ultraschall.Api_Path,"\\","/")

ultraschall.Api_ScriptPath=ultraschall.Api_Path.."/Scripts"

local L=reaper.GetExtState("ultraschall_api", "helpinstalled")
if L~="4.0beta2.7" then 
  reaper.AddRemoveReaScript(true, 0, ultraschall.Api_ScriptPath.."/ultraschall_Help_Ultraschall_Api_Functions_Reference.lua", false)
  reaper.AddRemoveReaScript(true, 0, ultraschall.Api_ScriptPath.."/ultraschall_Help_Reaper_Api_Documentation.lua", true)
  reaper.SetExtState("ultraschall_api", "helpinstalled", "4.0beta2.7", true)
end





ultraschall.ApiFunctionTest=function()
  --reaper.MB("Ultraschall Functions-Engine is OFF","Ultraschall-API",0)
  ultraschall.functions_works="off"
end

ultraschall.ApiDataTest=function()
  --reaper.MB("Ultraschall DataStructures-Engine is OFF","Ultraschall-API",0)
  ultraschall.data_works="off"
end

ultraschall.ApiGUITest=function()
  --reaper.MB("Ultraschall GUI-Engine is OFF","Ultraschall-API",0)
  ultraschall.gui_works="off"
end

ultraschall.ApiSoundTest=function()
  ultraschall.sound_works="off"
  --reaper.MB("Ultraschall Sound-Engine is OFF","Ultraschall-API",0)
end

ultraschall.ApiVideoTest=function()
  ultraschall.video_works="off"
  --reaper.MB("Ultraschall Video-Engine is OFF","Ultraschall-API",0)
end

ultraschall.ApiDocTest=function()
  ultraschall.doc_works="off"
  --reaper.MB("Ultraschall Doc-Engine is OFF","Ultraschall-API",0)
end

ultraschall.ApiTagTest=function()
  ultraschall.tag_works="off"
  --reaper.MB("Ultraschall Tag-Engine is OFF","Ultraschall-API",0)
end

ultraschall.ApiNetworkTest=function()
  ultraschall.network_works="off"
  --reaper.MB("Ultraschall Network-Engine is OFF","Ultraschall-API",0)
end


ultraschall.ApiBetaFunctionsTest=function()
  ultraschall.functions_beta_works="off"
  --reaper.MB("BETA-Ultraschall Functions-Engine is OFF","Ultraschall-API (BETA)",0)
end

function ultraschall.ApiBetaDataTest()
  ultraschall.data_beta_works="off"
  --reaper.MB("BETA-Ultraschall DataStructures-Engine is OFF","Ultraschall-API (BETA)",0)
end

ultraschall.ApiBetaGUITest=function()
  ultraschall.gui_beta_works="off"
  --reaper.MB("BETA-Ultraschall GUI-Engine is OFF","Ultraschall-API (BETA)",0)
end

ultraschall.ApiBetaSoundTest=function()
  ultraschall.sound_beta_works="off"
  --reaper.MB("BETA-Ultraschall Sound-Engine is OFF","Ultraschall-API (BETA)",0)
end

ultraschall.ApiBetaVideoTest=function()
  ultraschall.video_beta_works="off"
  --reaper.MB("BETA-Ultraschall Video-Engine is OFF","Ultraschall-API (BETA)",0)
end

ultraschall.ApiBetaDocTest=function()
  ultraschall.doc_beta_works="off"
  --reaper.MB("BETA-Ultraschall Doc-Engine is OFF","Ultraschall-API (BETA)",0)
end

ultraschall.ApiBetaTagTest=function()
  ultraschall.tag_beta_works="off"
  --reaper.MB("BETA-Ultraschall Tag-Engine is OFF","Ultraschall-API (BETA)",0)
end

ultraschall.ApiBetaNetworkTest=function()
  ultraschall.network_beta_works="off"
  --reaper.MB("BETA-Ultraschall Network-Engine is OFF","Ultraschall-API (BETA)",0)
end


-- include the individual parts of the framework, if set to ON
ultraschall.US_Functions_Engine = dofile(script_path .. "ultraschall_functions_engine.lua")
if ultraschall.US_DataStructures~="OFF" then ultraschall.US_DataStructure_Engine = dofile(script_path .. "ultraschall_datastructures_engine.lua") end
if ultraschall.US_GUI_Engine~="OFF" then ultraschall.US_GUI_Engine = dofile(script_path .. "ultraschall_gui_engine.lua") end
if ultraschall.US_Sound_Engine~="OFF" then ultraschall.US_Sound_Engine = dofile(script_path .. "ultraschall_sound_engine.lua") end
if ultraschall.US_Video_Engine~="OFF" then ultraschall.US_Video_Engine = dofile(script_path .. "ultraschall_video_engine.lua") end
if ultraschall.US_Doc_Engine~="OFF" then ultraschall.US_Doc_Engine = dofile(script_path .. "ultraschall_doc_engine.lua") end
if ultraschall.US_Tag_Engine~="OFF" then ultraschall.US_Tag_Engine = dofile(script_path .. "ultraschall_tag_engine.lua") end
if ultraschall.US_Network_Engine~="OFF" then ultraschall.US_Network_Engine = dofile(script_path .. "ultraschall_network_engine.lua") end

-- if BETA-functions are available and usage of beta-functions is set to ON, include them. 
-- Functions, that are in both, the "normal" parts of the framework as well as in the beta-part, will use the beta-version,
-- if betafunctions are set to ON
if ultraschall.US_BetaFunctions=="ON" then
  if reaper.file_exists(script_path.."ultraschall_functions_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_functions_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_datastructures_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_datastructures_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_gui_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_gui_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_sound_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_sound_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_video_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_video_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_doc_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_doc_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_tag_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_tag_engine_beta.lua") end
  if reaper.file_exists(script_path.."ultraschall_network_engine_beta.lua")==true then ultraschall.BETA=dofile(script_path .. "ultraschall_network_engine_beta.lua") end
end

-- In case of necessary hotfixes, if the file ultraschall_hotfixes.lua exists, the functions in it will overwrite previously existing ones.
if reaper.file_exists(script_path.."ultraschall_hotfixes.lua") then ultraschall.Hotfix=dofile(script_path .. "ultraschall_hotfixes.lua") end



function ultraschall.ApiTest()
    -- show "Api Part-Engine"-messages, when calling ultraschall.ApiTest()
    ultraschall.ApiFunctionTest()
    ultraschall.ApiDataTest()
    ultraschall.ApiGUITest()
    ultraschall.ApiSoundTest()
    ultraschall.ApiVideoTest()
    
    ultraschall.ApiDocTest()
    ultraschall.ApiTagTest()
    ultraschall.ApiNetworkTest()

    ultraschall.ApiBetaFunctionsTest()
    ultraschall.ApiBetaDataTest()
    ultraschall.ApiBetaGUITest()
    ultraschall.ApiBetaSoundTest()
    ultraschall.ApiBetaVideoTest()
    ultraschall.ApiBetaDocTest()
    ultraschall.ApiBetaTagTest()
    ultraschall.ApiBetaNetworkTest()
    
ultraschall.network_works="off"    
    
    reaper.MB("Functions-Engine="..ultraschall.functions_works.."\nData-Engine="..ultraschall.data_works.."\nGui-Engine="..ultraschall.gui_works.."\nSound-Engine="..ultraschall.sound_works.."\nVideo-Engine="..ultraschall.video_works.."\nDoc-Engine="..ultraschall.doc_works.."\nTag-Engine="..ultraschall.tag_works.."\nNetwork-Engine="..ultraschall.network_works.."\n\nBeta-Functions:\nFunctions-Beta-Engine="..ultraschall.functions_beta_works.."\nData-Beta-Engine="..ultraschall.data_beta_works.."\nGui-Beta-Engine="..ultraschall.gui_beta_works.."\nSound-Beta-Engine="..ultraschall.sound_beta_works.."\nVideo-Beta-Engine="..ultraschall.video_beta_works.."\nDoc-Beta-Engine="..ultraschall.doc_beta_works.."\nTag-Beta-Engine="..ultraschall.tag_beta_works.."\nNetwork-Beta-Engine="..ultraschall.network_beta_works,"Ultraschall API-TEST",0)
end
