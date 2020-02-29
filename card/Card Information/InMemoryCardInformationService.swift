class InMemoryCardInformationService: CardInformationService {
    func load() -> CardInformation {
        return CardInformation(logo: "mastercard logo", name: "Plamen")
    }
}
