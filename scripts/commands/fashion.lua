---------------------------------------------------------------------------------------------------
-- func: Fireworks!
-- desc: BIKINIS BIKINIS!
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)
    player:PrintToPlayer("BIKINI Shop for BNET.cc Players.", 0xF);

local stock = {
        -- CHOCOBO SET
        11500,100000,	-- Chocobo Beret
        27765,100000,	-- Chocobo Masque
        27911,100000,	-- Chocobo Suit
        17074,100000,	-- Chocobo Wand
        10811,100000,	-- Chocobo Shield
        --MOOGLE SET
        16118,100000,	-- Moogle Cap,Enchantment Teleport
        10429,100000,	-- Moogle Masque
        10250,100000,	-- Moogle Suit, Dispense: Mog Missile
        18401,100000,	-- Moogle Rod, Enchantment Give Gift
        18842,100000,	-- Nomad Moogle Rod, Enchantment Give Gift
        16182,100000,	-- Town Moogle Shield, Enchantment Moogle Japery
        16183,100000,	-- Nomad Moogle Shield, Enchantment Moogle Japery
        --NOVENNIAL SET
        11853,100000,	-- Novennial Coat
        11956,100000,	-- Novennial Hose
        11854,100000,	-- Novennial Dress
        11957,100000,	-- Novennial Boots
        --DINNER SET
        11355,100000,	-- Dinner Jacket
        16378,100000,	-- Dinner Hose
        --SWIMSUITS
        11265,100000,	-- HUME M TOP
        11266,100000,	-- HUME F TOP
        11267,100000,	-- ELV M TOP
        11268,100000,	-- ELV F TOP
        11269,100000,	-- TARU M TOP
        11270,100000,	-- TARU F TOP
        11271,100000,	-- MITHRA TOP
        11272,100000,	-- GALKA TOP
        16321,100000,	-- HUME M BOTTOM
        16322,100000,	-- HUME F BOTTOM
        16323,100000,	-- ELV M BOTTOM
        16324,100000,	-- ELV F BOTTOM
        16325,100000,	-- TARU M BOTTOM
        16326,100000,	-- TARU F BOTTOM
        16327,100000,	-- MITHRA BOTTOM
        16328,100000,	-- GALKA BOTTOM
        -- DREAM SET
        18863,100000,	-- Dream Bell
        15752,100000,	-- Dream Boots
        15178,100000,	-- Dream Hat
        10382,100000,	-- Dream Mittens
        11967,100000,	-- Dream Pants
        14519,100000,	-- Dream Robe
        11965,100000,	-- Dream Trousers
	}

showShop(player, STATIC, stock);
end