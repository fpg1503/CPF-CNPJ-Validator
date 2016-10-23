public enum Status {
    case valid
    case wrongLength
    case repeatedPattern
    case commonNumber
    case invalid
}

public struct ValidationOptions: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let addLeadingZeros          = ValidationOptions(rawValue: 1 << 0)
    public static let ignoreRemainigCharacters = ValidationOptions(rawValue: 1 << 1)
    public static let interpretOnlyNumbers     = ValidationOptions(rawValue: 1 << 2)
    public static let allowRepeatedPatterns    = ValidationOptions(rawValue: 1 << 3)
    public static let allowCommonNumbers       = ValidationOptions(rawValue: 1 << 4)
}

public struct Validator {
    public func validate(cpf: String, options: ValidationOptions = []) -> Status {
        return .valid
    }

    public func validate(cnpj: String, options: ValidationOptions = []) -> Status {
        return .valid
    }

}
