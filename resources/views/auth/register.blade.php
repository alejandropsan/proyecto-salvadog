<x-guest-layout>
    <form method="POST" action="{{ route('register') }}">
        @csrf

        <!-- Name -->
        <div>
            <x-input-label for="name" :value="__('Name')" />
            <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus />
            <x-input-error :messages="$errors->get('name')" class="mt-2" />
        </div>

        <!-- Nick -->
        <div>
            <x-input-label for="nick" :value="__('Nick')" />
            <x-text-input id="nick" class="block mt-1 w-full" type="text" name="nick" :value="old('nick')" required autofocus />
            <x-input-error :messages="$errors->get('nick')" class="mt-2" />
        </div>

        <!-- ID-role -->
        <div>
            <x-input-label for="id_role" :value="__('Rol de usuario')" />

            <x-text-input  id="4" class="block mt-1 w-full" type="radio" name="4-customer-employee" :value="old('4')" autofocus style="float: left; width: 20px; margin-right: 5px;" />
            <x-input-label for="4" :value="__('guest')" style="line-height: 25px;" />
            <x-input-error :messages="$errors->get('guest')" class="mt-2" />

            <x-text-input  id="customer" class="block mt-1 w-full" type="radio" name="guest-customer-employee" :value="old('customer')" autofocus style="float: left; width: 20px; margin-right: 5px;" />
            <x-input-label for="id_role2" :value="__('Customer')" style="line-height: 25px;" />
            <x-input-error :messages="$errors->get('id_role2')" class="mt-2" />

            <x-text-input  id="employee" class="block mt-1 w-full" type="radio" name="guest-customer-employee" :value="old('employee')" autofocus style="float: left; width: 20px; margin-right: 5px;" />
            <x-input-label for="id_role3" :value="__('Employee')" style="line-height: 25px;" />
            <x-input-error :messages="$errors->get('id_role3')" class="mt-2" />
        </div>


        <!-- Email Address -->
        <div class="mt-4">
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" :value="__('Password')" />

            <x-text-input id="password" class="block mt-1 w-full"
            type="password"
            name="password"
            required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Confirm Password -->
        <div class="mt-4">
            <x-input-label for="password_confirmation" :value="__('Confirm Password')" />

            <x-text-input id="password_confirmation" class="block mt-1 w-full"
            type="password"
            name="password_confirmation" required />

            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
        </div>

        <div class="flex items-center justify-end mt-4">
            <a class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800" href="{{ route('login') }}">
                {{ __('¿Ya estás registrado?') }}
            </a>

            <x-primary-button class="ml-4">
                {{ __('Registrate') }}
            </x-primary-button>
        </div>
    </form>
</x-guest-layout>
