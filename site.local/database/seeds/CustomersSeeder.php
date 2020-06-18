<?php


use Phinx\Seed\AbstractSeed;

class CustomersSeeder extends AbstractSeed
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeders is available here:
     * https://book.cakephp.org/phinx/0/en/seeding.html
     */
    public function run()
    {
        $faker = Faker\Factory::create();
        $data = [];
        for ($i = 0; $i < 20; $i++) {
            $data[] = [
                'name' => $faker->firstName.' '.$faker->lastName,
                'phone' => ($faker->tollFreePhoneNumber),
                'email' => $faker->email,
                'birth_date' => ($faker->dateTimeBetween('-40 years', '-20 years'))
                    ->format('Y-m-d'),
                'date_reg' => ($faker->dateTimeBetween('-10 years', 'now'))
                    ->format('Y-m-d'),
            ];
        }

        $this->table('customers')->insert($data)->saveData();
    }
}
