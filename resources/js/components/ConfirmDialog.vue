<template>
    <div>
        <button class="text-red-600" @click.prevent="$modal.show('confirm')" title="Delete" type="submit"><i class="far fa-trash-alt"></i></button>
        <modal name="confirm">
            <p class="text-center text-3xl mt-10 py-16">Are you sure ?</p>
            <div class="flex justify-center items-center m-auto">
                <button class="text-base rounded-lg py-1 px-6 text-white bg-gray-500 mx-2"
                        @click.prevent="cancelClick">
                    Cancel
                </button>
                <button class="text-base  rounded-lg py-1 px-6 text-white bg-red-600 text-white mx-2"
                        @click="handleClick(true)">
                    YES
                </button>
            </div>
        </modal>
    </div>
</template>

<script>
    export default {

        methods: {
            cancelClick() {
                this.$modal.hide('confirm')
            },

            handleClick(confirmed) {
                if (confirmed) {
                    this.$el.click();
                    this.$modal.hide('confirm')
                }
            }
        }
    }
</script>

<style scoped>

</style>