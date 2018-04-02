-----------------------------------
-- Area: Bastok Markets
--  NPC: Ulrike
-- Type: Goldsmithing Synthesis Image Support
-- !pos -218.399 -7.824 -56.203 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,6);
    local SkillCap = getCraftSkillCap(player, SKILL_GOLDSMITHING);
    local SkillLevel = player:getSkillLevel(SKILL_GOLDSMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effects.GOLDSMITHING_IMAGERY) == false) then
            player:startEvent(304,SkillCap,SkillLevel,2,201,player:getGil(),0,9,0);
        else
            player:startEvent(304,SkillCap,SkillLevel,2,201,player:getGil(),6975,9,0);
        end
    else
        player:startEvent(304);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 304 and option == 1) then
        player:messageSpecial(GOLDSMITHING_SUPPORT,0,3,2);
        player:addStatusEffect(dsp.effects.GOLDSMITHING_IMAGERY,1,0,120);
    end
end;