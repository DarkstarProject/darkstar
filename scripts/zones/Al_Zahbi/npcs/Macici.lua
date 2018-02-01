-----------------------------------
-- Area: Al Zahbi
--  NPC: Macici
-- Type: Smithing Normal/Adv. Image Support
-- !pos -35.163 -1 -31.351 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,8);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(EFFECT_SMITHING_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(233,8,0,0,0,188,0,2,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,8);
    local SkillLevel = player:getSkillLevel(SKILL_SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_SMITHING_IMAGERY) == false) then
            player:startEvent(232,8,SkillLevel,0,511,188,0,2,2184);
        else
            player:startEvent(232,8,SkillLevel,0,511,188,6566,2,2184);
        end
    else
        player:startEvent(232,0,0,0,0,0,0,2,0); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 232 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,2,1);
        player:addStatusEffect(EFFECT_SMITHING_IMAGERY,1,0,120);
    elseif (csid == 233) then
        player:messageSpecial(IMAGE_SUPPORT,0,2,0);
        player:addStatusEffect(EFFECT_SMITHING_IMAGERY,3,0,480);
    end
end;