-----------------------------------
-- Area: Fei'Yin
-- NPC: Seed Afterglow
-- @pos -94.342 -15.656 -85.889 204     Red
-- @pos -52.019 -16.525 38.848 204      Orange
-- @pos 36.000 -15.000 -35.000 204      Green
-- @pos 74.611 -16.123 134.570 204      Yellow
-- @pos -6.710  0.462 210.245 204       Cerulean
-- @pos -200.000 -15.425 120.000 204    Blue
-- @pos -168.000 0.114 130.000 204      Golden
-- @pos -130.000 0.113 8.000 204        Silver
-- @pos -50.000 0.114 32.000 204        White
-- Todo: NPC moving. In retail these move around with 3-5+ pos EACH
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local HasMark = player:hasKeyItem(MARK_OF_SEED);
    local HasAzureKey = player:hasKeyItem(AZURE_KEY);
    local HasIvoryKey = player:hasKeyItem(IVORY_KEY);
    local LastAzure = player:getVar("LastAzureKey");
    local LastIvory = player:getVar("LastIvoryKey");
    local CurrentDay = tonumber(os.date("%j"));
    local Mission = player:getCurrentMission(ACP);
    local NeedToZone = player:needToZone();
    local Afterglow = npc:getID();
    local First = 17613148;
    local MARK_EFFECT = player:hasStatusEffect(EFFECT_MARK_OF_SEED);
    local PROGRESS = player:getVar("SEED_AFTERGLOW_MASK");
    local INTENSITY = player:getVar("SEED_AFTERGLOW_INTENSITY");
    -- Awful lot to keep track of, ain't it?

    if (HasMark or HasAzureKey or HasIvoryKey or CurrentDay == LastAzure or CurrentDay == LastIvory or Mission < THOSE_WHO_LURK_IN_SHADOWS_II) then
        player:messageSpecial(SOFTLY_SHIMMERING_LIGHT);
    elseif (NeedToZone == true and player:hasStatusEffect(EFFECT_MARK_OF_SEED) == false) then
        player:messageSpecial(YOU_REACH_FOR_THE_LIGHT);
    elseif (Mission >= THOSE_WHO_LURK_IN_SHADOWS_II) then
        if (Afterglow == First and player:getMaskBit(PROGRESS,0) == false) then -- Red
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",0,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,0);
            end
        elseif (Afterglow == First+1 and player:getMaskBit(PROGRESS,1) == false) then -- Orange
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",1,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,1);
            end
        elseif (Afterglow == First+2 and player:getMaskBit(PROGRESS,2) == false) then -- Yellow
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",2,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,2);
            end
        elseif (Afterglow == First+3 and player:getMaskBit(PROGRESS,3) == false) then -- Green
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",3,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,3);
            end
        elseif (Afterglow == First+4 and player:getMaskBit(PROGRESS,4) == false) then -- Cerulean
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",4,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,4);
            end
        elseif (Afterglow == First+5 and player:getMaskBit(PROGRESS,5) == false) then -- Blue
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",5,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,5);
            end
        elseif (Afterglow == First+6 and player:getMaskBit(PROGRESS,6) == false) then -- Golden
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",6,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,6);
            end
        elseif (Afterglow == First+7 and player:getMaskBit(PROGRESS,7) == false) then -- Silver
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",7,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,7);
            end
        elseif (Afterglow == First+8 and player:getMaskBit(PROGRESS,8) == false) then -- White
            player:setMaskBit(PROGRESS,"SEED_AFTERGLOW_MASK",8,true);
            INTENSITY = INTENSITY + 1;
            if (INTENSITY == 9) then
                player:startEvent(0x01C);
            elseif (NeedToZone == false and MARK_EFFECT == false) then
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(YOU_REACH_OUT_TO_THE_LIGHT,0);
                player:addStatusEffectEx(EFFECT_MARK_OF_SEED, 0, 0, 30, 1800);
                player:needToZone(true);
                player:messageSpecial(THE_LIGHT_DWINDLES,0);
            else
                player:setVar("SEED_AFTERGLOW_INTENSITY",INTENSITY);
                player:messageSpecial(EVEN_GREATER_INTENSITY,8);
            end
        end
    else
        player:messageSpecial(SOFTLY_SHIMMERING_LIGHT);
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
    if (csid == 0x01C) then
        if ( option == 100) then
            player:messageSpecial(SCINTILLATING_BURST_OF_LIGHT);
            player:addKeyItem(MARK_OF_SEED);
            player:messageSpecial(KEYITEM_OBTAINED,MARK_OF_SEED);
        elseif (option == 200) then
            player:addKeyItem(AZURE_KEY);
            player:messageSpecial(KEYITEM_OBTAINED,AZURE_KEY);
        end
        player:delStatusEffectSilent(EFFECT_MARK_OF_SEED);
    end
end;