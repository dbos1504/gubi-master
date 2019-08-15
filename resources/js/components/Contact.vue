<template>
    <form @click.submit="sendMessage" >
        <div class="form-group lg:flex lg:justify-between">
            <input class="p-2 border bg-transparent w-full mr-2"
                   type="text"
                   name="firstname"
                   placeholder="Nafn"
                   id="firstname"
                   v-model="firstname">
            <input class="p-2 border w-full"
                   type="text"
                   name="lastname"
                   placeholder="Eftirnafn"
                   v-model="lastname">
        </div>
        <div class="form-group">
            <input class="p-2 border w-full"
                   type="email"
                   name="email"
                   placeholder="Netfang*"
                   v-model="email">
        </div>
        <div class="form-group">
            <input class="p-2 border w-full"
                   type="text"
                   name="subject"
                   placeholder="Titill*"
                   v-model="subject">
        </div>
        <div class="form-group">
            <textarea class="p-2 border w-full"
                      name="message" cols="30" rows="5"
                      placeholder="Skilaboð*"
                      v-model="message"></textarea>
        </div>
        <div class="form-group text-right">
            <button class="py-2 px-12 border border-black font-bold text-black uppercase" type="submit">Senda</button>
        </div>
        <modal name="success" classes="modal_contact bg-white" height="auto">
            <section class="okolo_poruka m-3 p-2 border-2 border-grey text-center relative">
                <p class="text-sm message_success text-orange-light tracking-wide message_sent font-medium">MESSAGE SENT</p>
                <p class="text-right mb-1 absolute close_message">
                    <a class="text-xs font-serif mr-16 text-grey" href="#" @click="$modal.hide('success')"><i class="fas fa-times-circle"></i></a>
                </p>
                <div class="flex justify-center items-center mt-12">
                    <img src="/img/message-sent.svg" alt="Sent">
                </div>
                <h5 class="font-serif font-bold text-black tracking-wide mt-10 mb-8 text-xl">Your message has been successfully sent</h5>
            </section>
        </modal>
    </form>
</template>

<script>
    export default {
        data() {
            return {
                firstname: '',
                lastname: '',
                email: '',
                subject: '',
                message: '',
            }
        },

        methods: {
            sendMessage() {
                this.$validator.validate().then(valid => {
                    if (valid) {
                        axios.post('/contact', {
                            firstname: this.firstname,
                            lastname: this.lastname,
                            email: this.email,
                            subject: this.subject,
                            message: this.message,
                        }).then(
                            this.$modal.show('success'),
                            this.firstname = '',
                            this.lastname = '',
                            this.email = '',
                            this.subject = '',
                            this.message = '',
                            this.$validator.reset(),
                            this.hide(),
                        );
                    }
                });
            },
            hide() {
                setTimeout(() => {
                    this.$modal.hide('success');
                }, 5000)
            },
        }
    }
</script>
