-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Beadurinc
-- Type: Smithing Synthesis Image Support
-- !pos -182.300 10.999 146.650 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,8);
    local SkillCap = getCraftSkillCap(player,SKILL_SMITHING);
    local SkillLevel = player:getSkillLevel(SKILL_SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_SMITHING_IMAGERY) == false) then
            player:startEvent(630,SkillCap,SkillLevel,2,205,player:getGil(),0,90,0);
        else
            player:startEvent(630,SkillCap,SkillLevel,2,205,player:getGil(),7054,90,0);
        end
    else
        player:startEvent(630,SkillCap,SkillLevel,2,201,player:getGil(),0,0,0); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 630 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,2,2);
        player:addStatusEffect(EFFECT_SMITHING_IMAGERY,1,0,120);
    end
end;