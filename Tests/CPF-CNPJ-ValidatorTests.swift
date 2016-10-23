import XCTest
@testable import CPF_CNPJ_Validator

class CPF_CNPJ_ValidatorTests: XCTestCase {

    let validator = Validator()

    func testEmptyCPF() {
        let cpf = ""
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.wrongLength)
    }

    func testEmptyCPFAddingLeadingZeros() {
        let cpf = ""
        let status = validator.validate(cpf: cpf, options: [.addLeadingZeros])
        XCTAssertEqual(status, Status.repeatedPattern)
    }

    func testEmptyCPFAddingLeadingAllowingRepeatedPatterns() {
        let cpf = ""
        let status = validator.validate(cpf: cpf, options: [.addLeadingZeros, .allowRepeatedPatterns])
        XCTAssertEqual(status, Status.valid)
    }

    func testShortCPF() {
        let cpf = "123"
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.wrongLength)
    }

    func testLongCPF() {
        let cpf = "1234567890912345678909"
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.wrongLength)
    }

    func testLongCPFIgnoringRemainingCharacters() {
        let cpf = "1234567890912345678909"
        let status = validator.validate(cpf: cpf, options: [.ignoreRemainingCharacters])
        XCTAssertEqual(status, Status.commonNumber)
    }

    func testLongCPFIgnoringRemainingCharactersAllowingCommonNumbers() {
        let cpf = "1234567890912345678909"
        let status = validator.validate(cpf: cpf, options: [.ignoreRemainingCharacters, .allowCommonNumbers])
        XCTAssertEqual(status, Status.valid)
    }

    func testInvalidCPF() {
        let cpf = "01002003040"
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.invalid)
    }

    func testValidCPF() {
        let cpf = "01002003032"
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.valid)
    }

    func testValidCPFWithLettersMixed() {
        let cpf = "01002aaaa003032"
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.invalid)
    }

    func testValidCPFWithLetterMixedInterpretingOnlyNumbers() {
        let cpf = "01002aaaa003032"
        let status = validator.validate(cpf: cpf, options: [.interpretOnlyNumbers])
        XCTAssertEqual(status, Status.valid)
    }

    func testValidFormattedCPF() {
        let cpf = "010.020.030-32"
        let status = validator.validate(cpf: cpf)
        XCTAssertEqual(status, Status.valid)
    }
}
