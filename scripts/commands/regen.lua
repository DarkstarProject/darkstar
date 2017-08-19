---------------------------------------------------------------------------------------------------
-- func: regen/refresh server wide. 
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player) -- Eventually needs modified based on level.. TBD!
	player:addStatusEffect(EFFECT_REFRESH,25,0,0);
    player:addStatusEffect(EFFECT_REGEN,28,0,0);
	player:addStatusEffect(EFFECT_REGAIN,15,1,0);
	player:addStatusEffect(EFFECT_HASTE,60,1,0);
    player:ChangeMusic(0,41);
    player:ChangeMusic(1,41);
end