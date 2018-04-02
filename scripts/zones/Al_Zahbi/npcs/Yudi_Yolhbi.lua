-----------------------------------
-- Area: Al Zahbi
--  NPC: Yudi Yolhbi
-- Type: Woodworking Normal/Adv. Image Support
-- !pos -71.584 -7 -56.018 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,9);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(dsp.effects.WOODWORKING_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(235,8,0,0,0,188,0,1,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,9);
    local SkillLevel = player:getSkillLevel(SKILL_WOODWORKING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effects.WOODWORKING_IMAGERY) == false) then
            player:startEvent(234,8,SkillLevel,0,511,188,0,1,2184);
        else
            player:startEvent(234,8,SkillLevel,0,511,188,7055,1,2184);
        end
    else
        player:startEvent(234,0,0,0,0,0,0,1,0); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 234 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,1,1);
        player:addStatusEffect(dsp.effects.WOODWORKING_IMAGERY,1,0,120);
    elseif (csid == 235) then
        player:messageSpecial(IMAGE_SUPPORT,0,1,0);
        player:addStatusEffect(dsp.effects.WOODWORKING_IMAGERY,3,0,480);
    end
end;