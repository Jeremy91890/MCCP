contract ​ERC808​ ​{
	 // Availability structure
	 enum Status { ​REQUESTED, REJECTED, CONFIRMED, CANCELLED }
	 Status BookingStatus;

	 struct ​availability​ {
	 	address ​_contractAdress;
		uint​ _resourceId ; // resource id OR bundle id
		uint​ _type; // Type of Availability
		uint​ _minDeposit ; // minimum BTU deposit for booking this resource
		uint​ _commission ; // commission amount paid to booker in BTU
		uint​ _freeCancelDateTs; // Limit date for a reservation cancellation
		uint​ _startDateTs; //availability start date timestamps
		uint​ _endDateTs; //availability end date timestamps
		BookingStatus​ _bookingStatus ; // reservation status
		string​ _metaDataLink // Link to Meta Data of the bookable resource (desc, image links, etc…)
	}

	//Submit one or multiple availability - implementation will be off-chain
	function​ publishAvailabilities ​(address​ _owner, availability[]​ _availability, bytes32 _signatureProof ) constant returns (uint​ status);
	
	//Query Availabilities - implementation will be off-chain
	function​ ListAvailabilities​(address​ _requester, string ​_criterias) constant returns​ (availability[] a​);

	//Request reservation
	function​ requestReservation​(address​ _requester, availability​ _availability) constant returns​ (uint​ status);
	
	//Check booking status
	function​ getReservationStatus​(address​ _requester, availability​ _availability) constant returns​ (BookingStatus ​status);
}