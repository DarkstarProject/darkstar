---------------------------------------------------------------------------------------------------
-- func: Teleports player to Pandemonium Warden.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player, x, y, z, zone)
		player:setPos('199', '33', '-115', '55', '68');
		-- player:costume(3093);
		-- player:PrintToPlayer("        PW Crashes the server. READ THE FORUMS");
		-- player:ChangeMusic(0,41);
		-- player:ChangeMusic(1,41);
		-- player:messagePublic(280, player, EFFECT_CHOCOBO, EFFECT_CHOCOBO);
end