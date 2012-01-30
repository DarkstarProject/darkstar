-----------------------------------
--	Author: Whasf
-- 	Field Manual
-- 	Working, 100%.
-- The differences between Field Manuals in other zones are Event ID, Regime IDs (5x) only. 

-----------------------------------
-- Includes
require("/scripts/globals/settings");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("/scripts/zones/East_Sarutabaruta/TextIDs");
require("/scripts/globals/fieldsofvalor");
package.loaded["/scripts/globals/fieldsofvalor"]=nil;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local hasRegime = player:getVar("fov_regimeid");
local tabs = player:getVar("tabs");
	--fm_event1 = (0x0049);
	--fm_event1:setParams(0,0,0,0,0,0,tabs,hasRegime);
	player:startEvent(0x003e,0,0,0,0,0,0,tabs,hasRegime);
 end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 end; 
 
 
--------------------------------------
-- onEventSelection
--------------------------------------
function onEventUpdate(player,csid,menuchoice)
--printf("menu choice: %u",menuchoice);
if(menuchoice==18) then --Page 1
	--get info
	info = getRegimeInfo(89);
--printf ("Debug: %u, %u, %u, %u, %u, %u",info.n1,info.n2,info.n3,info.n4,info.sl,info.el);
	player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,89);
elseif(menuchoice==34) then --Page 2
	--get info
	info = getRegimeInfo(90);
	player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,90);
elseif(menuchoice==50) then --Page 3
	--get info
	info = getRegimeInfo(91);
	player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,91);
elseif(menuchoice==66) then --Page 4
	--get info
	info = getRegimeInfo(92);
	player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,92);
elseif(menuchoice==82) then --Page 5
	--get info
	info = getRegimeInfo(93);
	player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,93);
elseif(menuchoice==1) then --View Regime (this option is only available if they have a regime active!)
	--get regime id and numbers killed...
	local regid = player:getVar("fov_regimeid");
	local n1 = player:getVar("fov_numkilled1");
	local n2 = player:getVar("fov_numkilled2");
	local n3 = player:getVar("fov_numkilled3");
	local n4 = player:getVar("fov_numkilled4");
	--get info
	info = getRegimeInfo(regid);
	player:updateEvent(info.n1,info.n2,info.n3,info.n4,n1,n2,n3,n4);
end 
--do not elseif this bit!!
if(menuchoice==6) then --Level range and training area on View Regime...
	local regid = player:getVar("fov_regimeid");
	info = getRegimeInfo(regid);
	player:updateEvent(0,0,0,0,0,info.sl,info.el,0);
end

--print("csid: ",csid);
--print("menuchoice: ",menuchoice);

end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
-- ================= FIELD SUPPORT ===============================================
if(option==53) then --Chose Regen. Regen from FoV removes all forms of regen.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-20;
	player:setVar("tabs",newtabs);
	--Removes regen if on player
	regen = player:getStatusEffect(EFFECT_REGEN);
	if (regen ~= nil) then
		player:removeStatusEffect(EFFECT_REGEN);
	end
	--Adds regen
	player:addStatusEffect(EFFECT_REGEN,1,3,3600,FLAG_DISPELABLE);
elseif(option==69) then --Chose Refresh, removes all other refresh.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-20;
	player:setVar("tabs",newtabs);
	--Removes refresh if on player
	refresh = player:getStatusEffect(EFFECT_REFRESH);
	if (refresh ~= nil) then
		player:removeStatusEffect(EFFECT_REFRESH);
	end
	--Add refresh
	player:addStatusEffect(EFFECT_REFRESH,1,3,3600,FLAG_DISPELABLE);
elseif(option==85) then --Chose Protect, removes all other protect.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-15;
	player:setVar("tabs",newtabs);
	--Removes protect if on player
	protect = player:getStatusEffect(EFFECT_PROTECT);
	if (protect ~= nil) then
		player:removeStatusEffect(EFFECT_PROTECT);
	end
	--Work out how much def to give (highest tier dependant on level)
	local def = 0;
	if (player:getMainLvl()<27) then --before protect 2, give protect 1
		def=10;
	elseif (player:getMainLvl()>=27 and player:getMainLvl()<47) then --after p2, before p3
		def=25;
	elseif (player:getMainLvl()>=47 and player:getMainLvl()<63) then --after p3, before p4
		def=40;
	elseif (player:getMainLvl()>=63) then --after p4
		def=55;
	end
	--Add protect
	player:addStatusEffect(EFFECT_PROTECT,def,0,1800,FLAG_DISPELABLE);
elseif(option==101) then --Chose Shell, removes all other shell.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-15;
	player:setVar("tabs",newtabs);
	--Removes shell if on player
	shell = player:getStatusEffect(EFFECT_SHELL);
	if (shell ~= nil) then
		player:removeStatusEffect(EFFECT_SHELL);
	end
	--Work out how much mdef to give (highest tier dependant on level)
	--values taken from Shell scripts by Tenjou.
	local def = 0;
	if (player:getMainLvl()<37) then --before shell 2, give shell 1
		def=10;
	elseif (player:getMainLvl()>=37 and player:getMainLvl()<57) then --after s2, before s3
		def=16;
	elseif (player:getMainLvl()>=57 and player:getMainLvl()<68) then --after s3, before s4
		def=23;
	elseif (player:getMainLvl()>=68) then --after s4
		def=28;
	end
	--Add shell
	player:addStatusEffect(EFFECT_SHELL,def,0,1800,FLAG_DISPELABLE);
elseif (option==37) then --Reraise chosen.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-10;
	player:setVar("tabs",newtabs);
	--Remove any other RR
	reraise = player:hasStatusEffect(EFFECT_RERAISE);
	if (reraise ~= nil) then
		player:removeStatusEffect(EFFECT_RERAISE);
	end
	--apply RR, 2 hour duration.
	player:addStatusEffect(EFFECT_RERAISE,power,0,7200,FLAG_DISPELABLE);
elseif (option==21) then --Return to home nation.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-50;
	player:setVar("tabs",newtabs);
	--get home nation (2=Windurst) (1=Bastok) (0=Sandy)
	local nation = player:getNation();
	if (nation==2) then --Windurst
	player:setPos(193,-12,222,75,0xF0);
	end
	if (nation==1) then --Bastok
	player:setPos(82,0,-71,249,0xEA);
	end
	if (nation==0) then --San d'Oria
	player:setPos(31,0,23,247,0xE7);
	end


--if(option==149) then --chose Hard Cookie, INT +4, MP +30 for 30 minutes 
--effect = player:getStatusEffect(EFFECT_FOOD);
--end

-- =========================== ELITE REGIMES =================================
-- =========================== TRAINING REGIMES ================================
elseif(option==3) then --Cancelled Regime.
	player:setVar("fov_regimeid",0);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	--Display message about cancelled regime.
	player:showText(player,9795);
elseif(option==18) then --Page 1
	player:setVar("fov_regimeid",89);
	player:setVar("fov_numneeded1",6);
	player:setVar("fov_numkilled1",0);
	--display message about training regime accepted!
	player:showText(player,9793);
	player:showText(player,9794);
elseif(option==34) then --Page 2
	player:setVar("fov_regimeid",90);
	player:setVar("fov_numkilled1",6);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",1);
	player:setVar("fov_numkilled4",8);
	--display message about training regime accepted!
	player:showText(player,9793);
	player:showText(player,9794);
elseif(option==50) then --Page 3
	player:setVar("fov_regimeid",91);
	player:setVar("fov_numkilled1",6);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",2);
	player:setVar("fov_numkilled4",6);
	--display message about training regime accepted!
	player:showText(player,9793);
	player:showText(player,9794);
elseif(option==66) then --Page 4
	player:setVar("fov_regimeid",92);
	player:setVar("fov_numkilled1",4);
	player:setVar("fov_numkilled2",2);
	player:setVar("fov_numkilled3",3);
	player:setVar("fov_numkilled4",6);
	--display message about training regime accepted!
	player:showText(player,9793);
	player:showText(player,9794);
elseif(option==82) then --Page 5
	player:setVar("fov_regimeid",93);
	player:setVar("fov_numkilled1",4);
	player:setVar("fov_numkilled2",3);
	player:setVar("fov_numkilled3",3);
	player:setVar("fov_numkilled4",6);
	--display message about training regime accepted!
	player:showText(player,9793);
	player:showText(player,9794);
end

--print("CSID:",csid);
--print("RESULT:",option);
end;