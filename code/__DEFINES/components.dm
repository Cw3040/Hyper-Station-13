#define SEND_SIGNAL(target, sigtype, arguments...) ( !target.comp_lookup || !target.comp_lookup[sigtype] ? NONE : target._SendSignal(sigtype, list(target, ##arguments)) )

#define SEND_GLOBAL_SIGNAL(sigtype, arguments...) ( SEND_SIGNAL(SSdcs, sigtype, ##arguments) )

//shorthand
#define GET_COMPONENT_FROM(varname, path, target) var##path/##varname = ##target.GetComponent(##path)
#define GET_COMPONENT(varname, path) GET_COMPONENT_FROM(varname, path, src)

#define COMPONENT_INCOMPATIBLE 1

// How multiple components of the exact same type are handled in the same datum

#define COMPONENT_DUPE_HIGHLANDER		0		//old component is deleted (default)
#define COMPONENT_DUPE_ALLOWED			1	//duplicates allowed
#define COMPONENT_DUPE_UNIQUE			2	//new component is deleted
#define COMPONENT_DUPE_UNIQUE_PASSARGS	4	//old component is given the initialization args of the new

// All signals. Format:
// When the signal is called: (signal arguments)
// All signals send the source datum of the signal as the first argument

// global signals
// These are signals which can be listened to by any component on any parent
// start global signals with "!", this used to be necessary but now it's just a formatting choice
//////////////////////////////////////////////////////////////////

// /datum signals
#define COMSIG_PARENT_QDELETED "parent_qdeleted"				//after a datum's Destroy() is called: (force, qdel_hint), at this point none of the other components chose to interrupt qdel and Destroy has been called

// /atom signals
	//Positions for overrides list
	//End positions
#define COMSIG_ATOM_RATVAR_ACT "atom_ratvar_act"				//from base of atom/ratvar_act(): ()
/////////////////



// /area signals

// /turf signals

// /atom/movable signals

// /mob signals

// /mob/living signals

// /mob/living/carbon signals

// /obj signals
#define COMSIG_OBJ_BREAK		"obj_break"						//from base of /obj/obj_break(): (damage_flag)

// /obj/item signals

// /obj/item/clothing signals

// /obj/item/implant signals
	//This uses all return values of COMSIG_IMPLANT_OTHER

// /obj/item/pda signals

// /obj/item/radio signals

// /obj/item/pen signals

// /mob/living/carbon/human signals

// /datum/species signals

/*******Component Specific Signals*******/
//Janitor

//Food

//Mood
#define COMSIG_INCREASE_SANITY "decrease_sanity" //Called when you want to increase sanity from anywhere in the code.
#define COMSIG_DECREASE_SANITY "increase_sanity" //Same as above but to decrease sanity instead.

//NTnet

//Nanites

// /datum/component/storage signals

// /datum/action signals

/*******Non-Signal Component Related Defines*******/

//Redirection component init flags
#define REDIRECT_TRANSFER_WITH_TURF 1

//Arch
#define ARCH_PROB "probability"					//Probability for each item
#define ARCH_MAXDROP "max_drop_amount"				//each item's max drop amount

//Ouch my toes!
#define CALTROP_BYPASS_SHOES 1
#define CALTROP_IGNORE_WALKERS 2
