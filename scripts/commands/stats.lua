---------------------------------------------------------------------------------------------------
-- func: @stats
-- auth: Omni
-- desc: Prints current Player stats to the in game chatlog.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	require("scripts/globals/status");
	require("scripts/globals/spoofchat");
	player:SpoofChatPlayer(string.format("Total Evasion: %s", player:getEVA()), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Total Accuracy: %s", player:getACC()), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Total Ranged Attack: %s", player:getRATT()), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Total Ranged Accuracy: %s", player:getRACC()), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Magic Attack Bonus: %s", player:getMod(MOD_MATT)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Magic Defense Bonus: %s", player:getMod(MOD_MATT)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Magic Accuracy Bonus: %s", player:getMod(MOD_MACC)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Haste from equipment: %s%%", player:getMod(MOD_HASTE_GEAR)/10), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Treasure Hunter Tier: %s", player:getMod(MOD_TREASURE_HUNTER)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Crit Rate Bonus: %s%%", player:getMod(MOD_CRITHITRATE)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Double Attack rate: %s%%", player:getMod(MOD_DOUBLE_ATTACK)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Triple Attack rate: %s%%", player:getMod(MOD_TRIPLE_ATTACK)), MESSAGE_ECHO);
	player:SpoofChatPlayer(string.format("Quadruple Attack rate: %s%%", player:getMod(MOD_QUAD_ATTACK)), MESSAGE_ECHO);
end;