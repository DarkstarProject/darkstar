---------------------------------------------------------------------------------------------------
-- func: GM Gear
-- auth: Tagban
-- desc: Gives an item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sii"
};

function onTrigger(player)
		-- ADD RACE SPECIFIC STARTGEAR
	if player:getRace() == 1 or player:getRace() == 2 then
		player:addItem(12551); -- GM Body
		player:addItem(12523); -- GM Head
		player:addItem(12807); -- GM Legs
		player:addItem(12935); -- GM Feet
		player:addItem(12679); -- GM Hands
        player:PrintToPlayer("Gear Added to Inventory");
	else
		player:PrintToPlayer("Race cannot wear GM Gear but here's the accessories...");
	end
	player:addItem(17012); -- GM Fishing Rod
	player:addItem(17644); -- GM GSword
	player:addItem(16622); -- GM Sword
	player:addItem(12332); -- GM Shield
	player:addItem(13505); -- GM Ring
	player:addItem(13358); -- GM Earring
	player:addItem(13606); -- GM Cape
	player:addItem(17174); -- GM Bow
	player:addItem(13215); -- GM Belt
	player:addItem(17326); -- GMArrow
	player:addItem(13074); -- GM Neck
end