---------------------------------------------------------------------------------------------------
-- func: RoZ Content Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of RoZ wares to aid you on your adventure!", 0xF);
stock = {
        -- Bastok
        -- 18278,15000000, -- Relic Blade
        -- 18302,15000000, -- Relic Scythe
        -- 18284,15000000, -- Relic Axe
        -- 18314,15000000, -- Relic Great Katana
        -- San d'Oria
        -- 18290,15000000, -- Relic Bhuj
        -- 18332,15000000, -- Relic Gun
        -- 18308,15000000, -- Relic Katana
        -- 18296,15000000, -- Relic Lance
        -- Windurst
        -- 18272,15000000, -- Relic Sword
        -- 18266,15000000, -- Relic Dagger
        -- 18260,15000000, -- Relic Knuckles
        -- 18320,15000000, -- Relic Maul
        -- Jeuno
        -- 18326,15000000, -- Relic Staff
        -- 18344,15000000, -- Relic Bow
        -- 18338,15000000, -- Relic Horn
        -- 15066,15000000, -- Relic Shield
        -- Xarcabard
        -- 1589,125000, -- Necropsyche
        -- 1582,450000, -- Celestial Fragment (Staff)
        -- 1579,450000, -- Demoniac Fragment (Katana)
        -- 1580,450000, -- Divine Fragment (Great Katana)
        -- 1585,450000, -- Ethereal Fragment (Marksmanship)
        -- 1581,450000, -- Heavenly Fragment (Club)
        -- 1573,450000, -- Holy Fragment (Sword)
        -- 1574,450000, -- Intricate Fragment (Great Sword)
        -- 1584,450000, -- Mysterial Fragment (Instrument)
        -- 1571,450000, -- Mystic Fragment (Hand-to-Hand)
        -- 1572,450000, -- Ornate Fragment (Dagger)
        -- 1575,450000, -- Runaeic Fragment (Axe)
        -- 1576,450000, -- Seraphic Fragment (Great Axe)
        -- 1583,450000, -- Snarled Fragment (Archery)
        -- 1578,450000, -- Stellar Fragment (Polearm)
        -- 1822,450000, -- Supernal Fragment (Shield)
        -- 1577,450000, -- Tenebrous Fragment (Scythe)
        -- Beaucedine
        -- 1570,450000, -- Attestation of Accuracy (Marksmanship)
        -- 1560,450000, -- Attestation of Bravery (Axe)
        -- 1557,450000, -- Attestation of Celerity (Dagger)
        -- 1565,450000, -- Attestation of Decisiveness (Great Katana)
        -- 1561,450000, -- Attestation of Force (Great Axe)
        -- 1563,450000, -- Attestation of Fortitude (Polearm)
        -- 1558,450000, -- Attestation of Glory (Sword)
        -- 1569,450000, -- Attestation of Harmony (Music)
        -- 1821,450000, -- Attestation of Invulnerability (Shield)
        -- 1564,450000, -- Attestation of Legerity (Katana)
        -- 1556,450000, -- Attestation of Might (Hand to Hand)
        -- 1559,450000, -- Attestation of Righteousness (Great Sword)
        -- 1566,450000, -- Attestation of Sacrifice (Club)
        -- 1568,450000, -- Attestation of Transcendence (Bow)
        -- 1562,450000, -- Attestation of Vigor (Scythe)
        -- 1567,450000, -- Attestation of Virtue (Staff)
        14739, 7000000, -- Suppanomimi Earring
        14740, 7000000, -- Knight's Earring
        14741, 7000000, -- Abyssal Earring
        14742, 7000000, -- Beastly Earring
        14743, 7000000, -- Bushinomimi Earring
        15260, 10000000, -- Hydra Beret
        14515, 10000000, -- Hydra doublet
        15595, 10000000, -- Hydra Brais
        14924, 10000000, -- Hydra gloves
        15680, 10000000, -- Hydra gaiters
        15194, 20000000, -- Maat's Cap
        28515, 7000000, -- Trux Earring
        28516, 7000000, -- Sanare Earring
        28517, 7000000, -- Crematio Earring
        28518, 7000000, -- Gelai Earring
        28519, 7000000, -- Tripudio Earring
        28578, 7000000, -- Patricius Ring
        21427, 15000000, -- Bloodrain strap
        21425, 15000000, -- Lentus Grip
        28461, 10000000, -- Sekhmet Corset
        28616, 10000000, -- Fravashi Mantle
        28389, 10000000, -- Agitator'S Collar
        20733, 15000000, -- Anahera Sabar
        20734, 15000000, -- Anahera Sword
        21049, 15000000, -- Anahera Blade
        20913, 15000000, -- Anahera scythe
        20822, 15000000, -- Anagram Tabar
        21181, 15000000, -- Venabulum
        20864, 15000000, -- Castigation
        21116, 15000000, -- Cagliostro's Rod
        20997, 15000000, -- Raimitsukane
        20765, 15000000, -- Tunglmyrkvi
        27744, 10000000, -- Lithelimb Cap
        28311, 10000000, -- Manabyss Pigaches
        28034, 10000000, -- Dynasty mitts
        28173, 10000000, -- Osmium cuisses
        28312, 10000000, -- Scamp's Sollerets
        28174, 10000000, -- Theurgist's Slacks
        28025, 10000000, -- Regimen Mittens
        28313, 10000000, -- Daihanshi Habaki
        27888, 10000000, -- Kyujutsugi
        21381, 7000000, -- Seraphicaller
        20770, 15000000, -- Mes'yohi Sword
        21122, 15000000, -- Mes'yohi Rod
        27886, 10000000, -- Mes'yohi Haubergeon
        28172, 10000000, -- Mes'yohi Slacks
        20632, 15000000, -- Vanir Knife
        21284, 15000000, -- Vanir Gun
        27887, 10000000, -- Vanir Cotehardie
        28310, 10000000, -- Vanir Boots
        20858, 15000000, -- Lightreaver
        28009, 10000000, -- Onimusha-no-Kote
        27858, 10000000, -- Dread Jupon
        28148, 10000000, -- Perdition Slops
        19770, 15000000,  -- Aliyat Chakram
    }

showShop(player, STATIC, stock);
end