------------------------
--    Dagan     -- 
-- Description: Restores HP and MP. Amount restored varies with TP. Gambanteinn: Aftermath.
-- Acquired permanently by completing the appropriate Walk of Echoes Weapon Skill Trials.
-- Can also be used by equipping Gambanteinn (85), Gambanteinn (90), Canne de Combat +1 or Canne de Combat +2.
-- Skillchain Properties: N/A
-- Modifiers: Max HP / Max MP
-- Amount restored in HP/MP by TP
-- Does not deal damage.
--------------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
---------------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)
    local ftphp = fTP(tp,0.22,0.34,0.52);
    local ftpmp = fTP(tp,0.15,0.25,0.35);
    player:addHP(ftphp*player:getMaxHP());
    return 0,0,false,(ftpmp*player:getMaxMP());
end
