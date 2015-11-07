% Problem #2: School’s Out!

teacher(knight).
teacher(gross).
teacher(evoy).
teacher(appleton).
teacher(parnell).

activity(nudist).
activity(bodyboarding).
activity(swimming).
activity(sightseeing).
activity(camping).

county(suffolk).
county(cornwall).
county(norfolk).
county(yorkshire).
county(cumbria).
county(hertfordshire).

subject(maths).
subject(science).
subject(english).
subject(history).
subject(pe).


solve :-
	activity(KnightActivity), 
	activity(GrossActivity), 
	activity(EvoyActivity), 
	activity(AppletonActivity), 
	activity(ParnellActivity), 
	all_different([KnightActivity, GrossActivity, EvoyActivity,
		AppletonActivity, ParnellActivity]),

	holiday(KnightHoliday), 
	holiday(GrossHoliday), 
	holiday(EvoyHoliday), 
	holiday(AppletonHoliday), 
	holiday(ParnellHoliday), 
	all_different([KnightHoliday, GrossHoliday, EvoyHoliday,
		AppletonHoliday, ParnellHoliday]),

	subject(KnightSubject), 
	subject(GrossSubject), 
	subject(EvoySubject), 
	subject(AppletonSubject), 
	subject(ParnellSubject), 
	all_different([KnightSubject, GrossSubject, EvoySubject,
		AppletonSubject, ParnellSubject]),

	county(KnightCounty), 
	county(GrossCounty), 
	county(EvoyCounty), 
	county(AppletonCounty), 
	county(ParnellCounty), 
	all_different([KnightCounty, GrossCounty, EvoyCounty,
		AppletonCounty, ParnellCounty]),

	Quads = [[knight, KnightCounty, KnightActivity, KnightClass],
		 [gross, GrossCounty, GrossActivity, GrossClass],
		 [evoy, EvoyCounty, EvoyActivity, EvoyClass],
		 [appleton, AppletonCounty, AppletonActivity, AppletonClass],
		 [parnell, ParnellCounty, ParnellActivity, ParnellClass]]. %TODO continue rule def with ,s













