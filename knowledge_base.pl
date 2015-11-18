% Problem #2: School’s Out!
% Each teacher of different subjects go on a different activity at a different location.


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


	Quadruples = [ [knight, KnightCounty, KnightActivity, KnightSubject],
		      	   [gross, GrossCounty, GrossActivity, GrossSubject],
		           [evoy, EvoyCounty, EvoyActivity, EvoySubject],
		           [appleton, AppletonCounty, AppletonActivity, AppletonSubject],
		           [parnell, ParnellCounty, ParnellActivity, ParnellSubject] ],


	% Rule 1: Ms. Gross teaches either maths or science. 
	% If Ms. Gross is going to a nudist colony, then she is going to Suffolk; 
	% otherwise she is going to Cornwall.

	( (member([gross, _, _, maths], Quadruples);
	   member([gross, _, _, science], Quadruples)),

	  (member([gross, suffolk, nudist, _], Quadruples);
	   (member([gross, cornwall, _, _], Quadruples),
	   	\+ member([gross, _, nudist, _], Quadruples))) ),


	% Rule 2. The science teacher (who is going body-boarding) 
	% is going to travel to Cornwall or Norfolk.

	( member([_, cornwall, bodyboarding, science], Quadruples);
	  member([_, norfolk, bodyboarding, science], Quadruples) ),


	% Rule 3. Mr. McEvoy (who is the history teacher) 
	% is going to Yorkshire or Cumbria.

	( member([evoy, yorkshire, _, history], Quadruples);
	  member([evoy, cumbria, _, history], Quadruples) ),


	% Rule 4. If the woman who is going to Hertfordshire is the English teacher, 
	% then she is Ms. Appleton; otherwise, she is Ms. Parnell (who is going swimming).

	member([parnell, _, swimming, _], Quadruples),

	( (member([_, hertfordshire, _, english], Quadruples),
		member([appleton, _, _, _], Quadruples));

	  (\+ member([_, hertfordshire, _, english], Quadruples),
		member([parnell, _, _, _], Quadruples)) ),


	% Rule 5. The person who is going to Yorkshire (who isn’t the PE teacher) 
	% isn’t the one who is going sightseeing.

	\+ member([_, yorkshire, _, pe], Quadruples),
	\+ member([_, yorkshire, sightseeing, _], Quadruples),


	% Rule 6. Ms. Gross isn’t the woman who going camping.

	\+ member([gross, _, camping, _], Quadruples),


	% Rule 7. One woman is going to a nudist colony on her holiday.

	( member([gross, _, nudist, _], Quadruples);
	  member([appleton, _, nudist, _], Quadruples);
	  member([parnell, _, nudist, _], Quadruples) ),


	tell(knight, KnightCounty, KnightActivity, KnightSubject),
	tell(gross, GrossCounty, GrossActivity, GrossSubject),
	tell(evoy, EvoyCounty, EvoyActivity, EvoySubject),
	tell(appleton, AppletonCounty, AppletonActivity, AppletonSubject),
	tell(parnell, ParnellCounty, ParnellActivity, ParnellSubject).


% Succeeds if all elements of the argument list are bound and different. 
% Fails if any elements are unbound or equal to some other element.

all_different([H|T]) :- member(H, T), !, fail. 
all_different([_|T]) :- all_different(T).
all_different([_]).

tell(W, X, Y, Z) :- write('Ms / Mr '), write(W), write(', who teaches ' ), write(Z), 
write(' went '), write(Y), write(' in '), write(X), nl.


