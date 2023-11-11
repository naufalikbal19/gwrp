enum E_PEMOTONG
{
    STREAMER_TAG_MAP_ICON:LockerMap,
    STREAMER_TAG_MAP_ICON:TempatKerja,
    STREAMER_TAG_MAP_ICON:AmbilMap,
	STREAMER_TAG_CP:LockerPemotong,
	STREAMER_TAG_CP:AmbilAyam,
	STREAMER_TAG_CP:AmbilAyamHidup,
	STREAMER_TAG_CP:PotongAyam,
	STREAMER_TAG_CP:PotongAyam2,
	STREAMER_TAG_CP:PotongAyam3,
	STREAMER_TAG_CP:PackingAyam,
	STREAMER_TAG_CP:PackingAyam2
}
new PemotongArea[MAX_PLAYERS][E_PEMOTONG];

DeletePemotongCP(playerid)
{
	if(IsValidDynamicCP(PemotongArea[playerid][LockerPemotong]))
	{
		DestroyDynamicCP(PemotongArea[playerid][LockerPemotong]);
		PemotongArea[playerid][LockerPemotong] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][AmbilAyam]))
	{
		DestroyDynamicCP(PemotongArea[playerid][AmbilAyam]);
		PemotongArea[playerid][AmbilAyam] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][AmbilAyamHidup]))
	{
		DestroyDynamicCP(PemotongArea[playerid][AmbilAyamHidup]);
		PemotongArea[playerid][AmbilAyamHidup] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PotongAyam]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PotongAyam]);
		PemotongArea[playerid][PotongAyam] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PotongAyam2]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PotongAyam2]);
		PemotongArea[playerid][PotongAyam2] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PotongAyam3]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PotongAyam3]);
		PemotongArea[playerid][PotongAyam3] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PackingAyam]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PackingAyam]);
		PemotongArea[playerid][PackingAyam] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PemotongArea[playerid][PackingAyam2]))
	{
		DestroyDynamicCP(PemotongArea[playerid][PackingAyam2]);
		PemotongArea[playerid][PackingAyam2] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicMapIcon(PemotongArea[playerid][LockerMap]))
	{
		DestroyDynamicMapIcon(PemotongArea[playerid][LockerMap]);
		PemotongArea[playerid][LockerMap] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PemotongArea[playerid][TempatKerja]))
	{
		DestroyDynamicMapIcon(PemotongArea[playerid][TempatKerja]);
		PemotongArea[playerid][TempatKerja] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PemotongArea[playerid][AmbilMap]))
	{
		DestroyDynamicMapIcon(PemotongArea[playerid][AmbilMap]);
		PemotongArea[playerid][AmbilMap] = STREAMER_TAG_MAP_ICON: -1;
	}
}

RefreshJobPemotong(playerid)
{
	DeletePemotongCP(playerid);

	if(pData[playerid][pJob] == 2)
	{
	    PemotongArea[playerid][AmbilAyam] = CreateDynamicCP(-1422.421142,-967.581909,200.775970, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][AmbilAyamHidup] = CreateDynamicCP(-1428.316528,-950.212158,201.093750, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PotongAyam] = CreateDynamicCP(-1113.361328,-1660.300415,76.378242, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PotongAyam2] = CreateDynamicCP(-1120.229736,-1660.261108,76.378242, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PotongAyam3] = CreateDynamicCP(-1107.819091,-1659.510375,76.378242, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PackingAyam] = CreateDynamicCP(-1115.366333,-1653.926269,76.388252, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][PackingAyam2] = CreateDynamicCP(-1115.089233,-1657.203491,76.388252, 2.0, -1, -1, playerid, 30.0);
	    PemotongArea[playerid][AmbilMap] = CreateDynamicMapIcon(-1113.361328,-1660.300415,76.378242, 14, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PemotongArea[playerid][TempatKerja] = CreateDynamicMapIcon(-1422.421142,-967.581909,200.775970, 14, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
	}
	return 1;
}

CMD:ambilayam(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, -1428.316528,-950.212158,201.093750))
        {
            if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "Anda Masih Proses Ayam");
            if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
            if(pData[playerid][AyamHidup] == 150) return ErrorMsg(playerid, "Anda sudah membawa 150 Ayam Hidup!");
            if(pData[playerid][DutyAmbilAyam] == 0) return ErrorMsg(playerid, "Anda belum izin dengan Jamal!");
            {
                pData[playerid][pPemotongStatus] += 1;
                ayamjob[playerid] = SetTimerEx("getchicken", 2000, false, "id", playerid);
                ShowProgressbar(playerid, "Mengambil Ayam", 2);
                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0, 1);
            } 
        }
        else return ErrorMsg(playerid, "Kamu Tidak Di Tempat Pengambilan Ayam.");
    }
    else ErrorMsg(playerid, "Anda bukan Bekerja Pemotong Ayam.");
    return 1;
}

CMD:izinayam(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.0, -1422.421142,-967.581909,200.775970))
        {
            if(pData[playerid][DutyAmbilAyam] == 1) return ErrorMsg(playerid, "Silahkan selesaikan pekerjaan terlebih dahulu");
            if(pData[playerid][AyamHidup] == 150) return ErrorMsg(playerid, "Anda sudah membawa 150 Ayam Hidup!");
            SetPlayerPos(playerid, -1428.316528,-950.212158,201.093750);
            pData[playerid][DutyAmbilAyam] = 1;
            PlayerData[playerid][pPos][0] = -1428.316528,
			PlayerData[playerid][pPos][1] = -950.212158,
			PlayerData[playerid][pPos][2] = 201.093750;
			PlayerData[playerid][pPos][3] = pData[playerid][pPosA];
			InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			SetTimerEx("SetPlayerCameraBehindAyam", 2500, false, "i", playerid);
        }
        else return ErrorMsg(playerid, "Kamu Tidak Di Tempat Pengolah Ayam.");
    }
    else ErrorMsg(playerid, "Anda bukan Bekerja Pemotong Ayam.");
    return 1;
}
forward getchicken(playerid);
public getchicken(playerid)
{
    if(IsPlayerConnected(playerid) && pData[playerid][pJob] == 2)
	{
		new rand = RandomEx(1,4);
	    if(rand == 1)
	    {
	        InfoMsg(playerid, "Anda gagal mendapatkan ayam, coba lagi.");
			pData[playerid][pActivityTime] = 0;
			KillTimer(ayamjob[playerid]);
			pData[playerid][pPemotongStatus] = 0;
			pData[playerid][pEnergy] -= 1;
			ClearAnimations(playerid);
		}
		else if(rand == 2)
		{
		    SuccesMsg(playerid, "Anda telah mengambil Ayam Hidup.");
		  	ShowItemBox(playerid, "Ayam", "Received_1x", 16776, 5);
			pData[playerid][pActivityTime] = 0;
			KillTimer(ayamjob[playerid]);
			pData[playerid][pPemotongStatus] = 0;
			pData[playerid][AyamHidup] += 1;
			pData[playerid][AmbilAyam] += 1;
			pData[playerid][pEnergy] -= 1;
			ClearAnimations(playerid);
		}
		else if(rand == 3)
		{
		    SuccesMsg(playerid, "Anda telah mengambil Ayam Hidup.");
		  	ShowItemBox(playerid, "Ayam", "Received_1x", 16776, 5);
			pData[playerid][pActivityTime] = 0;
			KillTimer(ayamjob[playerid]);
			pData[playerid][pPemotongStatus] = 0;
			pData[playerid][AyamHidup] += 1;
			pData[playerid][AmbilAyam] += 1;
			pData[playerid][pEnergy] -= 1;
			ClearAnimations(playerid);
		}
		else if(rand == 4)
		{
		    InfoMsg(playerid, "Anda gagal mendapatkan ayam, coba lagi.");
			pData[playerid][pActivityTime] = 0;
			KillTimer(ayamjob[playerid]);
			pData[playerid][pPemotongStatus] = 0;
			pData[playerid][pEnergy] -= 1;
			ClearAnimations(playerid);
		}
	}
	return 1;
}

CMD:potongayamdentot(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "Anda Masih potong Ayam");
        if(pData[playerid][AyamPotong] == 30) return ErrorMsg(playerid, "Anda sudah membawa 150 Ayam Potong!");
        if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
        if(pData[playerid][AyamHidup] < 1) return ErrorMsg(playerid, "Kamu Tidak Mengambil Ayam Hidup.");
        {
            pData[playerid][pPemotongStatus] += 1;

            TogglePlayerControllable(playerid, 0);
            ShowProgressbar(playerid, "Memotong Ayam", 7);
            ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
            ayamjob[playerid] = SetTimerEx("frychicken", 7000, false, "id", playerid);
        }
    }
    else return ErrorMsg(playerid, "anda bukan Tukang Ayam!");
    return 1;
}

forward frychicken(playerid);
public frychicken(playerid)
{
	SuccesMsg(playerid, "Anda telah berhasil Memotong.");
 	TogglePlayerControllable(playerid, 1);
  	ShowItemBox(playerid, "Chicken", "Removed_1x", 16776, 3);
  	ShowItemBox(playerid, "Ayam_Potong", "Received_5x", 2806, 3);
   	KillTimer(ayamjob[playerid]);
    pData[playerid][pActivityTime] = 0;
    pData[playerid][AyamPotong] += 5;
    pData[playerid][AyamHidup] -= 1;
    pData[playerid][pPemotongStatus] -= 1;
    pData[playerid][pEnergy] -= 2;
    ClearAnimations(playerid);
    return 1;
}

CMD:packingayamdentot(playerid, params[])
{
    if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
    {
        if(pData[playerid][pPemotongStatus] == 1) return ErrorMsg(playerid, "Anda masih packing ayam");
        if(pData[playerid][AyamPotong] < 1) return ErrorMsg(playerid, "Anda Tidak Punya Ayam Potong.");
        if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
        if(pData[playerid][AyamFillet] == 150) return ErrorMsg(playerid, "Anda sudah membawa 150 Ayam Fillet!");
        {
            pData[playerid][pPemotongStatus] += 1;

            TogglePlayerControllable(playerid, 0);
            ayamjob[playerid] = SetTimerEx("packingchicken", 5000, false, "id", playerid);
            ShowProgressbar(playerid, "Membungkus Ayam", 5);
            ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
        }
    }
    else return ErrorMsg(playerid, "anda bukan pekerja Pemotong Ayam!");
    return 1;
}
forward packingchicken(playerid);
public packingchicken(playerid)
{
	SuccesMsg(playerid, "Anda telah berhasil membungkus Ayam Potong.");
 	TogglePlayerControllable(playerid, 1);
  	KillTimer(ayamjob[playerid]);
   	pData[playerid][pActivityTime] = 0;
    pData[playerid][AyamFillet] += 1;
    ShowItemBox(playerid, "Ayam_Potong", "Removed_3x", 2806, 3);
    ShowItemBox(playerid, "Paket_Ayam", "Received_1x", 19566, 3);
    pData[playerid][AyamPotong] -= 3;
    pData[playerid][pPemotongStatus] -= 1;
    pData[playerid][pEnergy] -= 2;
    ClearAnimations(playerid);
    return 1;
}

CMD:jualayam(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.5, 2506.981933,-2637.118896,13.646511))
		return ErrorMsg(playerid, "Kamu Tidak Berada Di HoliMarket!");
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
	if(pData[playerid][AyamFillet] < 1) return ErrorMsg(playerid, "Anda tidak memiliki 1 paket ayam!");
	new pay = pData[playerid][AyamFillet] * 40;
	new total = pData[playerid][AyamFillet];
	GivePlayerMoneyEx(playerid, pay);
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, total);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Paket_Ayam", str, 19566, total);
	AyamFill += total;
	Server_MinMoney(pay);
	pData[playerid][AyamFillet] = 0;
	ShowProgressbar(playerid, "Menjual Paket Ayam", 5);
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

