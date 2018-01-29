-----------------------------------
-- Area: Al Zahbi
--  NPC: Zwaluh
-- Type: Leathercraft Normal/Adv. Image Support
-- !pos -71.556 -6.999 -103.015 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,7);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(227,8,0,0,0,188,0,5,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,7);
    local SkillLevel = player:getSkillLevel(SKILL_LEATHERCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY) == false) then
            player:startEvent(226,8,SkillLevel,0,511,188,0,5,2184);
        else
            player:startEvent(226,8,SkillLevel,0,511,188,7127,5,2184);
        end
    else
        player:startEvent(226,0,0,0,0,0,0,5,0); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 226 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,5,1);
        player:addStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY,1,0,120);
    elseif (csid == 227) then
        player:messageSpecial(IMAGE_SUPPORT,0,5,0);
        player:addStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY,3,0,480);
    end
end;