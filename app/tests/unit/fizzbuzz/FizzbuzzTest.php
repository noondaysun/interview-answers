<?php

namespace Tests\Unit\Fizzbuzz;

use PHPUnit\Framework\TestCase;

class FizzbuzzTest extends TestCase
{
    /** @var FizzBuzz */
    private $fizzbuzz;

    public function setUp()
    {
        parent::setUp();

        $this->fizzbuzz = new FizzBuzz(range(0, 100));
    }

    /**
     * @dataProvider numberProvider
     * @param int   $number
     * @param mixed $expectedValue
     */
    public function testFizzBuzz(int $number, mixed $expectedValue)
    {
        $this->assertSame($expectedValue, $this->fizzbuzz->checkValue($number));
    }

    public function numberProvider(): array
    {
        return [
            'fizz 1' => [3, 'fizz'],
            'buzz 1' => [5, 'buzz'],
            'fizzbuzz 1' => [15, 'fizzbuzz'],
            'fizz 2' => [6, 'fizz'],
            'buzz 2' => [10, 'buzz'],
            'fizzbuzz 2' => [30, 'fizzbuzz'],
            'number 1' => [22, 22],
            'number 2' => [102, 102],
        ];
    }
}