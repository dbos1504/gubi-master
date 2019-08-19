<template>
    <button @clicked="test" @click="sent" class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i>
        <modal name="confirm">
            <p class="text-center text-3xl mt-10 py-16">Are you sure ?</p>
            <div class="flex justify-center items-center m-auto">
                <button class="text-base rounded-lg py-1 px-6 text-white bg-gray-500 mx-2"
                        @click.prevent="cancelInq">
                    Cancel
                </button>
                <button class="text-base  rounded-lg py-1 px-6 text-white bg-red-600 text-white mx-2"
                        @click="handleClick(true)">
                    YES
                </button>
            </div>
        </modal>
    </button>
</template>

<script>
    export default {

        data() {
            return {
                confirmed: false
            }
        },

        methods: {
            sent(e) {
                e.preventDefault();
                this.$modal.show('confirm');
            },
            handleClick(confirmed) {
                this.$emit('clicked', confirmed);
            },
            cancelInq()
            {
                this.$modal.hide('confirm')
            },
            test(confirmed) {
                if (confirmed)  {
                    this.confirmed = true;
                    this.handleClick(confirmed);
                    this.$el.click();
                }
            }

        }
    }
</script>

<style scoped>

</style>