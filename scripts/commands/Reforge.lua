---------------------------------------------------------------------------------------------------
-- func: reforge artifact gear
-- auth: <Unknown> :: Wadski
-- desc: Opens Shop for reforge gear
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
28244,25500, -- Pummeler's Calliagae +1
28111,25500, -- Pummeler's cuisses +1
27684,25500, -- Pummeler's Mask +1
27828,25500, -- Pummeler's Lorica +1
27964,25500, -- Pummeler's Mufflers +1
27829,25500, -- Anchorite's Cyclas +1
28245,25500, -- Anchorite's gaiters +1
27965,25500, -- Anchorite's Gloves +1
28112,25500, -- Anchorite's Hose +1
27685,25500, -- Anchorite's Crown +1
27830,25500, -- Theophany Briault +1
27686,25500, -- Theophany Cap +1
28246,25500, -- Theophany duckbills +1
27966,25500, -- Theophany Mitts +1
28113,25500, -- Theophany Pantaloons +1
27831,25500, -- Spaekona's Coat +1
27687,25500, -- Spaekona's Petastos +1
28247,25500, -- Spaekona's Sabots +1
28114,25500, -- Spaekona's Tonban +1
27967,25500, -- Spaekona's Gloves +1
27688,25000, -- Atrophy Chapeau +1
28248,25000, -- Atrophy Boots +1
27968,25000, -- Atrophy Gloves +1
27832,25000, -- Atrophy Tabard +1
28115,25000, -- Atrophy Tights +1
27969,25000, -- Pillager's Armlets +1
27689,25000, -- Pillager's Bonnet +1
28116,25000, -- Pillager's Culottes +1
28249,25000, -- Pillager's Poulaines +1
27833,25000, -- Pillager's Vest +1
28117,25000, -- Reverence Breeches +1
27690,25000, -- Reverence Coronet +1
27970,25000, -- Reverence Gauntlets +1
28250,25000, -- Reverence Leggings +1
27834,25000, -- Reverence Surcoat +1
27691,25000, -- Ignominy Burgeonet +1
27835,25000, -- Ignominy Cuirass +1
28118,25000, -- Ignominy Flanchard +1
27971,25000, -- Ignominy Gauntlets +1
28251,25000, -- Ignominy Sollerets +1
27692,25000, -- Totemic Helm +1
28119,25000, -- Totemic Trousers +1
27836,25000, -- Totemic Jackcoat +1
27972,25000, -- Totemic Gloves +1
28252,25000, -- Totemic Gaiters +1
28253,25000, -- Brioso Slippers +1
27693,25000, -- Brioso Roundlet +1
27837,25000, -- Brioso Justaucorps +1
27973,25000, -- Brioso Cuffs +1
28120,25000, -- Brioso Cannions +1
28254,25000, -- Orion Socks +1
27838,25000, -- Orion Jerkin +1
27974,25000, -- Orion Bracers +1
28121,25000, -- Orion Braccae +1
27694,25000, -- Orion Beret +1
27975,25000, -- Wakido Kote +1
27695,25000, -- Wakido Kabuto +1
28122,25000, -- Wakido Haidate +1
27839,25000, -- Wakido Domaru +1
28255,25000, -- Wakido Sune-Ate +1
27976,25000, -- Hachiya Tekko +1
27696,25000, -- Hachiya Hatsuburi +1
28256,25000, -- Hachiya Kyahan +1
28123,25000, -- Hachiya Hakama +1
27840,25000, -- Hachiya Chainmail +1
27841,25000, -- Vishap Mail +1
28257,25000, -- Vishap Greaves +1
27977,25000, -- Vishap Finger Gauntlets +1
28124,25000, -- Vishap Brais +1
27697,25000, -- Vishap Armet +1
28125,25000, -- Convoker's Spats +1
28258,25000, -- Convoker's Pigaches +1
27698,25000, -- Convoker's Horn +1
27842,25000, -- Convoker's Doublet +1
27978,25000, -- Convoker's Bracers +1
28126,25000, -- Assimilator's Shalwar +1
27699,25000, -- Assimilator's Keffiyeh +1
27843,25000, -- Assimilator's Jubbah +1
28259,25000, -- Assimilator's Charuqs +1
27979,25000, -- Assimilator's Bazubands +1
28127,25000, -- Laksamana's Trews +1
27700,25000, -- Laksamana's Hat +1
27980,25000, -- Laksamana's Gants +1
27844,25000, -- Laksamana's Frac +1
28260,25000, -- Laksamana's Bottes +1
27845,25000, -- Foire Tobe +1
27701,25000, -- Foire Taj +1
27981,25000, -- Foire Dastanas +1
28128,25000, -- Foire Churidars +1
28261,25000, -- Foire Babouches +1
28130,25000, -- Maxixi Tights +1 [Fem.]
28129,25000, -- Maxixi Tights +1 [Male]
27703,25000, -- Maxixi Tiara +1 [Fem.]
27702,25000, -- Maxixi Tiara +1 [Male]
28263,25000, -- Maxixi Shoes +1 [Fem.]
28262,25000, -- Maxixi Shoes +1 [Male]
27847,25000, -- Maxixi Casaque +1 [Fem.]
27846,25000, -- Maxixi Casaque +1 [Male]
27893,25000, -- Maxixi Bangles +1 [Fem.]
27892,25000, -- Maxixi Bangles +1 [Male]
28131,25000, -- Academic's Pants +1
27704,25000, -- Academic's Mortarboard +1
28264,25000, -- Academic's Loafers +1
27848,25000, -- Academic's Gown +1
27984,25000, -- Academic's Bracers +1
27986,25000, -- Runeist Mitons +1
27850,25000, -- Runeist Coat +1
28266,25000, -- Runeist Bottes +1
28133,25000, -- Runeist Trousers +1
27706,25000, -- Runeist Bandeau +1
27849,25000, -- Geomancy Tunic +1
28265,25000, -- Geomancy Sandals +1
27985,25000, -- Geomancy Mitaines +1
28132,25000, -- Geomancy Pants +1
27705,25000, -- Geomancy Galero +1

	}
 
showShop(player, STATIC, stock);
end
