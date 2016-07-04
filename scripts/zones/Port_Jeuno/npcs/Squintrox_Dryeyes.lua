-----------------------------------
--  Area: Port Jeuno
--   NPC: Squintrox Dryeyes
--  Type: Addon Mission Merchant
--  @pos -100.071 -1 11.869 246
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local now = tonumber(os.date("%j"));
    local count = trade:getItemCount();
    local sLux = trade:hasItemQty(2740,1);
    local sLuna = trade:hasItemQty(2741,1);
    local sAstrum = trade:hasItemQty(2742,1);
    local orcArmor = trade:hasItemQty(2757,1);
    local quadavBack = trade:hasItemQty(596,1);
    local yagCaulk = trade:hasItemQty(2759,1);
    local eKitBlind = trade:hasItemQty(2780,1);
    local eKitPoison = trade:hasItemQty(2779,1);
    local eKitSilence = trade:hasItemQty(2782,1);
    local eKitSleep = trade:hasItemQty(2781,1);
    local uggalepihWhistle = trade:hasItemQty(1184,1);
    local ACPm = player:getCurrentMission(ACP);
    local AMKm = player:getCurrentMission(AMK);
    local ASAm = player:getCurrentMission(ASA);
    local CrimsonKey = player:hasKeyItem(CRIMSON_KEY);
    local LastCrimson = player:getVar("LastCrimsonKey"); -- When last Crimson key was obtained

    if (ENABLE_ACP == 0 and ENABLE_AMK == 0 and ENABLE_ASA ==0) then
        player:showText(npc,GET_LOST);
    else    -- Crimson Key: Trade Seedspall's Lux, Luna, Astrum
        if (ENABLE_ACP == 1 and sLux and sLuna and sAstrum and count == 3 and ACPm >= GATHERER_OF_LIGHT_I and CrimsonKey == false and now ~= LastCrimson) then -- and timer stuff here) then
            player:tradeComplete();
            player:addKeyItem(CRIMSON_KEY);
            player:setVar("LastCrimsonKey", os.date("%j"));
            player:messageSpecial(DRYEYES_2);
            player:messageSpecial(KEYITEM_OBTAINED,CRIMSON_KEY);
        elseif (sLux and sLuna and sAstrum and count == 3 and (now == LastCrimson or CrimsonKey == true)) then
            player:messageSpecial(DRYEYES_3,CRIMSON_KEY);
        -- White Coral Key:
        -- elseif (ENABLE_AMK == 1 and 
            -- haven't even started AMK related trades yet.
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (ENABLE_ACP == 0 and ENABLE_AMK == 0 and ENABLE_ASA ==0) then
        player:showText(npc,GET_LOST);
    else
        player:startEvent(0x0143);
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
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
    -- uncommented printf till we have all optionIDs mapped out.
    local now = tonumber(os.date("%j"));
    local ACPm = player:getCurrentMission(ACP);
    local AMKm = player:getCurrentMission(AMK);
    local ASAm = player:getCurrentMission(ASA);
    local salad = player:hasKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD);
    local juice = player:hasKeyItem(JUG_OF_GREASY_GOBLIN_JUICE);
    local grub = player:hasKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB);
    local ViridianKey = player:hasKeyItem(VIRIDIAN_KEY);
    local LastViridian = player:getVar("LastViridianKey"); -- When last Viridian key was obtained

    if (csid == 0x0143) then
        if (option == 1) then
            player:showText(player,DRYEYES_1);
        elseif (option == 100) then
            if (salad and juice and grub and ACPm >= GATHERER_OF_LIGHT_I and ViridianKey == false and now ~= LastViridian) then
                player:addKeyItem(VIRIDIAN_KEY);
                player:delKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD);
                player:delKeyItem(JUG_OF_GREASY_GOBLIN_JUICE);
                player:delKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB);
                player:setVar("LastViridianKey", os.date("%j"));
                player:showText(player,DRYEYES_2);
                player:messageSpecial(KEYITEM_OBTAINED,VIRIDIAN_KEY);
            elseif (now == LastViridian or ViridianKey == true) then
                player:messageSpecial(DRYEYES_3,VIRIDIAN_KEY);
            else
                -- player:showText(player, ? );
                -- Doesn't seem to be a message for trying when you don't have the key items?
            end
        -- Blue coral Key
        -- elseif (option == 101) then
            -- if
            -- end
        end
    end
end;

