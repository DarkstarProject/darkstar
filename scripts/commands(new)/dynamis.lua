---------------------------------------------------------------------------------------------------
-- func: Dynamis Base Weapon Purchase 
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Dynamis Weapon. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	player:PrintToPlayer("Welcome to BNET.cc's shop of KABR", 0xF);
stock = {
-- Bastok
18278,250000, -- Relic Blade
18302,250000, -- Relic Scythe
18284,250000, -- Relic Axe
18314,250000, -- Relic Great Katana
-- San d'Oria
18290,250000, -- Relic Bhuj
18332,250000, -- Relic Gun
18308,250000, -- Relic Katana
18296,250000, -- Relic Lance
-- Windurst
18272,250000, -- Relic Sword
18266,250000, -- Relic Dagger
18260,250000, -- Relic Knuckles
18320,250000, -- Relic Maul
-- Jeuno
18326,250000, -- Relic Staff
18344,250000, -- Relic Bow
18338,250000, -- Relic Horn
15066,250000, -- Relic Shield
-- Xarcabard
1589,125000, -- Necropsyche
1582,450000, -- Celestial Fragment (Staff)
1579,450000, -- Demoniac Fragment (Katana)
1580,450000, -- Divine Fragment (Great Katana) 
1585,450000, -- Ethereal Fragment (Marksmanship)
1581,450000, -- Heavenly Fragment (Club)
1573,450000, -- Holy Fragment (Sword)
1574,450000, -- Intricate Fragment (Great Sword)
1584,450000, -- Mysterial Fragment (Instrument)
1571,450000, -- Mystic Fragment (Hand-to-Hand)
1572,450000, -- Ornate Fragment (Dagger)
1575,450000, -- Runaeic Fragment (Axe)
1576,450000, -- Seraphic Fragment (Great Axe)
1583,450000, -- Snarled Fragment (Archery)
1578,450000, -- Stellar Fragment (Polearm)
1822,450000, -- Supernal Fragment (Shield)
1577,450000, -- Tenebrous Fragment (Scythe)
-- Beaucedine
1570,450000, -- Attestation of Accuracy (Marksmanship)
1560,450000, -- Attestation of Bravery (Axe)
1557,450000, -- Attestation of Celerity (Dagger)
1565,450000, -- Attestation of Decisiveness (Great Katana)
1561,450000, -- Attestation of Force (Great Axe)
1563,450000, -- Attestation of Fortitude (Polearm)
1558,450000, -- Attestation of Glory (Sword)
1569,450000, -- Attestation of Harmony (Music)
1821,450000, -- Attestation of Invulnerability (Shield)
1564,450000, -- Attestation of Legerity (Katana) 
1556,450000, -- Attestation of Might (Hand to Hand)
1559,450000, -- Attestation of Righteousness (Great Sword)
1566,450000, -- Attestation of Sacrifice (Club)
1568,450000, -- Attestation of Transcendence (Bow)
1562,450000, -- Attestation of Vigor (Scythe)
1567,450000, -- Attestation of Virtue (Staff)
	}
 
showShop(player, STATIC, stock);
end