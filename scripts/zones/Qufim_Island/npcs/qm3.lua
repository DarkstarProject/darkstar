-----------------------------------
-- Area: Qufim Island
-- NPC: ??? (qm3)
-- Mission: ACP - The Echo Awakens
-- @zone 126
-- @pos -120.342 -19.471 306.661
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Qufim_Island/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Seedspall's Lux, Luna, Astrum
    if (player:getCurrentMission(ACP) == THE_ECHO_AWAKENS and trade:getItemCount() == 3 
    and trade:hasItemQty(2740,1) and trade:hasItemQty(2741,1) and trade:hasItemQty(2742,1)) then
        player:tradeComplete();
        player:startEvent(0x001F);
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    local ACPm = player:getCurrentMission(ACP);
    local now = tonumber(os.date("%j"));
    local SR = player:hasKeyItem(SEEDSPALL_ROSEUM)
    local SC = player:hasKeyItem(SEEDSPALL_CAERULUM)
    local SV = player:hasKeyItem(SEEDSPALL_VIRIDIS)
    local AmberKey = player:hasKeyItem(AMBER_KEY);
    local LastAmber = player:getVar("LastAmberKey"); -- When last Amber key was obtained
    local LastViridian = player:getVar("LastViridianKey"); -- When last Viridian key was obtained

    if (ENABLE_ACP == 1 and player:hasKeyItem(AMBER_KEY) == false) then
        if (ACPm == GATHERER_OF_LIGHT_I and SR and SC and SV and now ~= LastViridian) then
            player:startEvent(0x0020);
        elseif (ACPm == GATHERER_OF_LIGHT_II and player:getVar("SEED_MANDY") == 0) then
            -- Spawn Seed mandragora's
            player:setVar("SEED_MANDY",1); -- This will need moved into Seed mandies onDeath script later.
            player:PrintToPlayer( "Confrontation Battles are not working yet." );
            -- EFFECT_CONFRONTATION for 30 min
        elseif (ACPm == GATHERER_OF_LIGHT_II and player:getVar("SEED_MANDY") == 1) then -- change SEED_MANDY var number later when battle actually works (intended purpose is to track number of slain mandies).
            player:setVar("SEED_MANDY",0);
            player:startEvent(0x0022);
        -- elseif (ACPm >= THOSE_WHO_LURK_IN_SHADOWS_I and AmberKey == false and now ~= LastAmber and now ~= LastViridian and SR and SC and SV and player:getVar("SEED_MANDY") == 0) then
            -- This is for repeats to get amber keys.
            -- Spawn Seed mandragora's with EFFECT_CONFRONTATION for 30 min
        -- elseif (SR and SC and SV and ACPm >= THOSE_WHO_LURK_IN_SHADOWS_I and player:getVar("SEED_MANDY") == 1) then
            -- player:addKeyItem(AMBER_KEY);
            -- player:setVar("LastAmberKey", os.date("%j"));
            -- player:messageSpecial(KEYITEM_OBTAINED,AMBER_KEY);
            -- player:setVar("SEED_MANDY",0);
            -- player:delKeyItem(SEEDSPALL_ROSEUM)
            -- player:delKeyItem(SEEDSPALL_CAERULUM)
            -- player:delKeyItem(SEEDSPALL_VIRIDIS)
        else
            -- Todo: find retail message (if any) and text its ID
        end
    else
        -- Todo: find retail message (if any) and text its ID
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x001F) then
        player:completeMission(ACP,THE_ECHO_AWAKENS);
        player:addMission(ACP,GATHERER_OF_LIGHT_I);
    elseif (csid == 0x0020) then
        player:completeMission(ACP,GATHERER_OF_LIGHT_I);
        player:addMission(ACP,GATHERER_OF_LIGHT_II);
        player:delKeyItem(SEEDSPALL_ROSEUM)
        player:delKeyItem(SEEDSPALL_CAERULUM)
        player:delKeyItem(SEEDSPALL_VIRIDIS)
    elseif (csid == 0x0022) then
        player:completeMission(ACP,GATHERER_OF_LIGHT_II);
        player:addMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_I);
    end
end;