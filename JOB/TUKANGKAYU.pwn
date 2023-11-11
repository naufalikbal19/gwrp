enum E_PENEBANG
{
	STREAMER_TAG_AREA:PotongKayu1
}
new PenebangArea[MAX_PLAYERS][E_PENEBANG];

DeletePenebangCP(playerid)
{
    if(IsValidDynamicArea(PenebangArea[playerid][PotongKayu1]))
	{
		DestroyDynamicArea(PenebangArea[playerid][PotongKayu1]);
		PenebangArea[playerid][PotongKayu1] = STREAMER_TAG_AREA: -1;
	}
}

RefreshJobPenebang(playerid)
{
	DeletePenebangCP(playerid);
	if(pData[playerid][pJob] == 8)
	{
	    PenebangArea[playerid][PotongKayu1] = CreateDynamicCircle(-1060.852172,-1195.437011,129.664138, 2.0, 0, 0, -1);
	}
	return 1;
}
