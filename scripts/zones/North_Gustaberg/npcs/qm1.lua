-----------------------------------
-- Area: North Gustaberg
-- NPC: qm1 (???)
-- Involved in Quest "The Siren's Tear"
-- @pos 309.600, 2.600, 324.000 106 | DB start position
-- @pos 290.000, 0.600, 332.100 106 | alternative start position
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x000a);
end;


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    local npc = player:getEventTarget();

    if (csid == 0x000a and option == 0) then
        local mainweapon = player:getEquipID(SLOT_MAIN);
        local subweapon = player:getEquipID(SLOT_SUB);

        if (mainweapon == 0 and subweapon == 0) then
            local freeslots = player:getFreeSlotsCount();
            local alreadyHasItem = player:hasItem(576);
            local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);
            local SirensTearProgress = player:getVar("SirensTear");

            if (SirensTear == QUEST_COMPLETED and SirensTearProgress < 2) then 
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,576);
            else
                if (freeslots == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,576);
                elseif (alreadyHasItem) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED_TWICE,576);
                    player:addItem(576);
                else
                    player:addItem(576);
                    player:messageSpecial(ITEM_OBTAINED,576);
                    resetSirenTear(npc);
                end
            end
        else
            player:messageSpecial(SHINING_OBJECT_SLIPS_AWAY);
            moveSirenTear(npc);
        end
    end 
end;


-----------------------------------
-- Additional Functions
-----------------------------------

function moveSirenTear(npc)
    -- determining starting point of the journey using the 3rd decimal place
    npcPos = math.floor(math.floor(npc:getXPos())*1000000 + math.floor(npc:getYPos())*1000 + npc:getZPos());
    disp = (npc:getYPos()*100 - math.floor(npc:getYPos()*100+0.5))*10;
    dispf = disp*0.001;

    switch (npcPos) : caseof {
        [309002324] = function (x) npc:setPos(296,3+dispf,220,0); end,
        [296003220] = function (x) npc:setPos(349.48,3.3+dispf,208,0); end,
        [349003208] = function (x) npc:setPos(332.1,6+dispf,150.1); end,
        [332006150] = function (x) if (disp == 0) then npc:setPos(290,0.601,332.1); else npc:setPos(309.6,2.6,324); end end,
        [290000332] = function (x) npc:setPos(296,3+dispf,220,0); end,
    default = function (x) end }
end;


function resetSirenTear(npc)
    npcPos = math.floor(math.floor(npc:getXPos())*1000000 + math.floor(npc:getYPos())*1000 + npc:getZPos());
    disp = (npc:getYPos()*100 - math.floor(npc:getYPos()*100+0.5))*10;
    
    if (npcPos == 290000332 or disp == 1) then
        npc:setPos(309.6,2.6,324);
    else
        npc:setPos(290,0.601,332.1);
    end
end;