---------------------------------------------------------------------------------------------------
-- func: regen
-- auth:
-- desc: .toggles regen
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

-- Don't use a var here, it doesn't get cleared when the effects get removed by causes other than GM command...
function onTrigger(player)
	if (player:getMainLvl() <= 75) then
		-- Clear any existing...
		player:delStatusEffect(EFFECT_REGEN);
		player:delStatusEffect(EFFECT_REFRESH);
		player:delStatusEffect(EFFECT_REGAIN);
		-- And replace with fresh status...
		player:addStatusEffect(EFFECT_REGEN,10,0,0);
		player:addStatusEffect(EFFECT_REFRESH,6,0,0);
		player:addStatusEffect(EFFECT_REGAIN,5,1,0);
	else
		player:PrintToPlayer("Sorry your level is too high for this command right now!, only level 75 and lower are permitted.");
	end
end