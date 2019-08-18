<template>
        <modal name="confirm">
            <p class="text-center text-3xl mt-10 py-16">Are you sure ?</p>
            <div class="flex justify-center items-center m-auto">
                <button class="text-base rounded-lg py-1 px-6 text-white bg-gray-500 mx-2"
                        @click.prevent="cancelClick">
                    Cancel
                </button>
                <button class="text-base  rounded-lg py-1 px-6 text-white bg-red-600 text-white mx-2"
                        @click="handleClick()">
                    YES
                </button>
            </div>
        </modal>

</template>

<script>
    export default {
        props: ['data'],

        data() {
          return {
              action: '/home/inquiry/' + this.data.id + '/destroy' ,
          }
        },

        methods: {
            cancelClick() {
                this.$modal.hide('confirm')
            },

            handleClick() {
                    axios.delete('/home/inquiry/destroy/' + this.data.id);

                    this.$modal.hide('confirm')
            }
        }
    }
</script>

<style scoped>

</style>