---------------------------------------------------------------------------------------------------
-- func: @sjboost
-- auth: TeoTwawki
-- desc: Toggles alternate SJ cap of 2/3 instead of 1/2
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
};

function onTrigger(player,target)
	if (target == nil) then
		target = player:getName();
	end

	local targ = GetPlayerByName( target );
	if (targ ~= nil) then
		if (targ:hasStatusEffect(EFFECT_SJCAP_BOOST)) then
			player:delStatusEffect(EFFECT_SJCAP_BOOST);
		else
			player:addStatusEffectEx(EFFECT_SJCAP_BOOST,EFFECT_TRANSCENDENCY,0,0,0)
		end
	else
		player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
	end    
end