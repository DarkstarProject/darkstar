-----------------------------------
-- Ability: Mug
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
    if(math.random()<0.9) then
    	local gil = target:getGil();

        if(gil == nil) then
            gil = 0;
        end

        -- is notorious
        -- all notorious monsters can be mugged
        if(target:isMobType(2) and gil <= 0) then
            gil = target:getMainLvl() * 20;
        end

        if(gil <= 0) then
            player:messageTarget(244, target);
        else
            if(player:getEquipID(SLOT_HEAD) == 15077) then
                gil = gil * 2;
            end

            player:addGil(gil);
            player:messageTarget(129, target, 41, gil);
            return gil;
        end
    else
        player:messageTarget(244, target);
    end
end;