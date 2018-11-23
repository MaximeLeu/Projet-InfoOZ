local
   % See project statement for API details.
   [Project] = {Link ['Project2018.ozf']}
   Time = {Link ['x-oz://boot/Time']}.1.getReferenceTime

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   % Translate a note to the extended notation.
   fun {NoteToExtended Note}
      case Note
      of Name#Octave then
         note(name:Name octave:Octave sharp:true duration:1.0 instrument:none)
      [] Atom then
         case {AtomToString Atom}
         of [_] then
            note(name:Atom octave:4 sharp:false duration:1.0 instrument:none)
         [] [N O] then
            note(name:{StringToAtom [N]}
                 octave:{StringToInt [O]}
                 sharp:false
                 duration:1.0
                 instrument: none)
         end
      end
   end



   %------------------------------------------------------------------------------------------------------------------------------------------------------------------
   %Commençons par analyser le contenu d'une partition

   fun{GetPItem Partition} %Voir mon code mooc de data abstaction
      local Hidden in
	 fun{Hidden Partition X}
	    case Partition of nil then nil
	    [] H|T then
	       if Partition == X then T 
	       else H|{Hidden Partition X}
	       end
	    end
	 end
	 {Hidden Partition Partition.1}
      end
   end
   

   
	 
   
   
	 
   
   

   %-------------------------------------------------------------------------------------------------------------------------------------------------------------------
   %Création des transformations sur partition
   fun{Duration} end
   fun{Stretch} end
   fun{Drone} end
   fun{Transpose} end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   fun {PartitionToTimedList Partition}
      % TODO
      nil
   end

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   %--------------------------------------------------------------------------------------------------------------------------------------------------------------------
   %Filtres sur la musique 
   fun{Reverse} end
   fun{Repeat} end
   fun{Loop} end
   fun{Clip} end
   fun{Echo} end
   fun{Fade} end
   fun{Cut} end
   fun {Mix P2T Music}
      % TODO
      {Project.readFile 'wave/animaux/cow.wav'}
   end

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   Music = {Project.load 'joy.dj.oz'}
   Start

   % Uncomment next line to insert your tests.
   % \insert 'tests.oz'
   % !!! Remove this before submitting.
in
   Start = {Time}

   % Uncomment next line to run your tests.
   % {Test Mix PartitionToTimedList}

   % Add variables to this list to avoid "local variable used only once"
   % warnings.
   {ForAll [NoteToExtended Music] Wait}
   
   % Calls your code, prints the result and outputs the result to `out.wav`.
   % You don't need to modify this.
   {Browse {Project.run Mix PartitionToTimedList Music 'out.wav'}}
   
   % Shows the total time to run your code.
   {Browse {IntToFloat {Time}-Start} / 1000.0}
end