---------------------------------------------------------------------------------------------------
-- func: @message2server <MSG_TEXT> <optional MSG_TYPE>
-- auth: TeoTwawki
-- desc: Spoofs a chat message to the entire server. Max 20 words.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "issssssssssssssssssss"
};

function onTrigger(player, MSG_TYPE, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t)
	if (MSG_TYPE == nil or tonumber(MSG_TYPE) == nil) then
		player:PrintToPlayer("Didn't see a valid MSG_TYP, so printing available types at you!");
		player:SpoofChatPlayer("Say = 0", 0, nil );
		player:SpoofChatPlayer("Shout = 1", 1, nil );
		player:SpoofChatPlayer("Tell = 2", 2, nil );
		player:SpoofChatPlayer("Party = 4", 4, nil );
		player:SpoofChatPlayer("1st LS = 5", 5, nil );
		player:SpoofChatPlayer("System message = 6 or 7", 6, nil );
		player:SpoofChatPlayer("Emote = 8", 8, nil );
		player:SpoofChatPlayer("Say with no name = 13", 13, nil );
		player:SpoofChatPlayer("Shout with no name = 14", 14, nil );
		player:SpoofChatPlayer("Party with no name = 15", 15, nil );
		player:SpoofChatPlayer("1st LS with no name = 16", 16, nil );
		player:SpoofChatPlayer("Echo = 17", 17, nil );
		player:SpoofChatPlayer("Echo = 20", 20, nil );
		player:SpoofChatPlayer("Yell = 26", 26, nil );
		player:SpoofChatPlayer("2nd LS = 27", 27, nil );
		player:SpoofChatPlayer("2nd LS with no name = 28", 28, nil );
		player:SpoofChatPlayer("Unity = 33", 33, nil );
	else
		if (t == nil) then t = ""; end		if (s == nil) then s = ""; end
		if (r == nil) then r = ""; end		if (q == nil) then q = ""; end
		if (p == nil) then p = ""; end		if (o == nil) then o = ""; end
		if (n == nil) then n = ""; end		if (m == nil) then m = ""; end
		if (l == nil) then l = ""; end		if (k == nil) then k = ""; end
		if (j == nil) then j = ""; end		if (i == nil) then i = ""; end
		if (h == nil) then h = ""; end		if (g == nil) then g = ""; end
		if (f == nil) then f = ""; end		if (e == nil) then e = ""; end
		if (d == nil) then d = ""; end		if (c == nil) then c = ""; end
		if (b == nil) then b = ""; end		if (a == nil) then a = ""; end
		local MSG_TEXT = table.concat({a, " ", b, " ", c, " ", d, " ", e, " ", f, " ", g, " ", h, " ", i, " ", j, " ", k, " ", l, " ", m, " ", n, " ", o, " ", p, " ", q, " ", r, " ", s, " ", t});
		player:SpoofChatServer(MSG_TEXT, MSG_TYPE);
	end
end;