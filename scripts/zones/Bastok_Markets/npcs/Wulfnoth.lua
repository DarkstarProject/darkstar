-----------------------------------
--  Area: Bastok Markets
--  NPC:  Wulfnoth
--  Type: Goldsmithing Synthesis Image Support
--  @pos -211.937 -7.814 -56.292 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/status");
require("scripts/globals/crafting");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,6);
    local SkillCap = getCraftSkillCap(player, SKILL_GLD);
    local SkillLevel = player:getSkillLevel(SKILL_GLD);
    
    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_GOLDSMITHING_IMAGERY) == false) then
			player:startEvent(0x012F,SkillCap,SkillLevel,1,201,player:getGil(),0,3,0);
	    else
            player:startEvent(0x012F,SkillCap,SkillLevel,1,201,player:getGil(),7054,3,0);
	    end
	else
        player:startEvent(0x012F);
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x012F and option == 1) then
        player:messageSpecial(GOLDSMITHING_SUPPORT,0,3,1);
		player:addStatusEffect(EFFECT_GOLDSMITHING_IMAGERY,1,0,120);
    end
end;



