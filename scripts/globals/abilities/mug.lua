-----------------------------------
-- Ability: Mug
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
    if(math.random()>0.9) then
    	local gil = target:getGil();

        if(gil <= 0 or gil == nil) then
            player:messageBasic(244);
            return;
        end

        if(player:getEquipID(SLOT_HEAD) == 15077) then
            gil = gil * 2;
        end

        player:addGil(gil);
        player:messageBasic(129,41,gil);
        return gil;
    else
        player:messageBasic(244);
    end
end;