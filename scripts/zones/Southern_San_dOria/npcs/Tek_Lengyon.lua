-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Tek Lengyon
-- Type: Leathercraft Synthesis Image Support
-- !pos -190.120 -2.999 2.770 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,7);
    local SkillCap = getCraftSkillCap(player, SKILL_LEATHERCRAFT);
    local SkillLevel = player:getSkillLevel(SKILL_LEATHERCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY) == false) then
            player:startEvent(652,SkillCap,SkillLevel,2,239,player:getGil(),0,0,0);
        else
            player:startEvent(652,SkillCap,SkillLevel,2,239,player:getGil(),7075,0,0);
        end
    else
        player:startEvent(652); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 652 and option == 1) then
        player:messageSpecial(LEATHER_SUPPORT,0,5,2);
        player:addStatusEffect(EFFECT_LEATHERCRAFT_IMAGERY,1,0,120);
    end
end;