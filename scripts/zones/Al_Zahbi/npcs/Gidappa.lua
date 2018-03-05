-----------------------------------
-- Area: Al Zahbi
--  NPC: Gidappa
-- Type: Clothcraft Normal/Adv. Image Support
-- !pos 70.228 -7 -54.089 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,3);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(229,8,0,0,0,188,0,4,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end

end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,3);
    local SkillLevel = player:getSkillLevel(SKILL_CLOTHCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY) == false) then
            player:startEvent(228,8,SkillLevel,0,511,188,0,4,2184);
        else
            player:startEvent(228,8,SkillLevel,0,511,188,7127,4,2184);
        end
    else
        player:startEvent(228,0,0,0,0,0,0,4,0); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 228 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,4,1);
        player:addStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY,1,0,120);
    elseif (csid == 229) then
        player:messageSpecial(IMAGE_SUPPORT,0,4,0);
        player:addStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY,3,0,480);
    end
end;