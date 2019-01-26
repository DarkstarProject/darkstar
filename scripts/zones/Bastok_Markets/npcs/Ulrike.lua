-----------------------------------
-- Area: Bastok Markets
--  NPC: Ulrike
-- Type: Goldsmithing Synthesis Image Support
-- !pos -218.399 -7.824 -56.203 235
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
local ID = require("scripts/zones/Bastok_Markets/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,6);
    local SkillCap = getCraftSkillCap(player, dsp.skill.GOLDSMITHING);
    local SkillLevel = player:getSkillLevel(dsp.skill.GOLDSMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effect.GOLDSMITHING_IMAGERY) == false) then
            player:startEvent(304,SkillCap,SkillLevel,2,201,player:getGil(),0,9,0);
        else
            player:startEvent(304,SkillCap,SkillLevel,2,201,player:getGil(),6975,9,0);
        end
    else
        player:startEvent(304);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 304 and option == 1) then
        player:messageSpecial(ID.text.GOLDSMITHING_SUPPORT,0,3,2);
        player:addStatusEffect(dsp.effect.GOLDSMITHING_IMAGERY,1,0,120);
    end
end;