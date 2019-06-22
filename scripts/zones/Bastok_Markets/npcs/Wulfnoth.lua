-----------------------------------
-- Area: Bastok Markets
--  NPC: Wulfnoth
-- Type: Goldsmithing Synthesis Image Support
-- !pos -211.937 -7.814 -56.292 235
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
            player:startEvent(303,SkillCap,SkillLevel,1,201,player:getGil(),0,3,0);
        else
            player:startEvent(303,SkillCap,SkillLevel,1,201,player:getGil(),7054,3,0);
        end
    else
        player:startEvent(303);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 303 and option == 1) then
        player:messageSpecial(ID.text.GOLDSMITHING_SUPPORT,0,3,1);
        player:addStatusEffect(dsp.effect.GOLDSMITHING_IMAGERY,1,0,120);
    end
end;