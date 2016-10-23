import Foundation

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
    public static let ignoreRemainingCharacters = ValidationOptions(rawValue: 1 << 1)
    public static let interpretOnlyNumbers     = ValidationOptions(rawValue: 1 << 2)
    public static let allowRepeatedPatterns    = ValidationOptions(rawValue: 1 << 3)
    public static let allowCommonNumbers       = ValidationOptions(rawValue: 1 << 4)
}

public struct Validator {
    public func validate(cpf: String, options: ValidationOptions = []) -> Status {
        guard isValid(cpf, options: options) else { return .invalid }

        let desiredLength = 11
        let cleanCPF = clean(cpf, options: options, length: desiredLength)

        guard cleanCPF.count == desiredLength else { return .wrongLength }

        guard options.contains(.allowRepeatedPatterns) ||
            !isRepeatedPattern(cleanCPF) else {
            return .repeatedPattern
        }

        guard options.contains(.allowCommonNumbers) ||
            !isCommonNumber(cleanCPF) else {
                return .repeatedPattern
        }

        //TODO: Validate

        return .valid
    }

    public func validate(cnpj: String, options: ValidationOptions = []) -> Status {
        return .valid
    }
}

fileprivate extension Validator {
    fileprivate func isValid(_ string: String, options: ValidationOptions) -> Bool {
        guard !options.contains(.interpretOnlyNumbers) else { return true }

        let characters = string.characters.map { String($0) }
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789-.")
        let charactersRemovingAllowedCharacters = characters.filter {
            $0.rangeOfCharacter(from: allowedCharacterSet) == nil
        }

        return charactersRemovingAllowedCharacters.count == 0
    }


    fileprivate func clean(_ string: String, options: ValidationOptions, length: Int) -> [Int] {
        let characters = string.characters.map { String($0) }
        let numbers = characters.map { Int($0) }.flatMap { $0 }

        let count = numbers.count

        if count > length && options.contains(.ignoreRemainingCharacters) {
            return Array(numbers[0..<length])
        } else if count < length && options.contains(.addLeadingZeros) {
            let zerosToAdd = length - count
            let zeros = Array(repeatElement(0, count: zerosToAdd))
            return zeros + numbers
        } else {
            return numbers
        }
    }

    fileprivate func isRepeatedPattern(_ numbers: [Int]) -> Bool {
        return Set(numbers).count <= 1
    }

    fileprivate func isCommonNumber(_ numbers: [Int]) -> Bool {
        let number = numbers.map { String($0) }.reduce("", +)
        let commonNumbers = ["12345678909"]

        return commonNumbers.contains(number)
    }
}
