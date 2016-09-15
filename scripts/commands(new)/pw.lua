---------------------------------------------------------------------------------------------------
-- func: kb/behemoth @PW
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad." ) );
else
    player:costume(3093);
    player:PrintToPlayer("        PW Crashes the server. READ THE FORUMS");
    player:ChangeMusic(0,41);
    player:ChangeMusic(1,41);
	-- player:messagePublic(280, player, EFFECT_CHOCOBO, EFFECT_CHOCOBO);
end
end